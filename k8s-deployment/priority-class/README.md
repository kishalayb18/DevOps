# Kubernetes Pod Priority and Preemption Guide

This document provides a comprehensive overview of Kubernetes Pod Priority and Preemption, including configuration, scheduling behavior, and practical validation steps. Pod priorities ensure critical workloads are scheduled and protected while less critical pods can be evicted under resource constraints.

## Overview

Pod Priority determines the relative importance of a pod within a cluster. The Kubernetes scheduler uses priorities to:

- Schedule higher-priority pods ahead of lower-priority ones when resources are limited.
- Preempt (evict) lower-priority pods to make room for higher-priority pods that cannot be scheduled otherwise.

Pod Preemption is the process of evicting lower-priority pods to accommodate higher-priority pod placement.

## Key Concepts

### Priority Classes

Priority Classes are cluster-level resources that define priority levels. Each pod references a Priority Class, which assigns a numeric priority value to that pod.

```yaml
apiVersion: scheduling.k8s.io/v1
kind: PriorityClass
metadata:
  name: high-priority
value: 1000
globalDefault: false
description: "High priority for system components"
```

Key fields:

- **value**: Numeric priority (higher = more important). Typically ranges from 0 to 1,000,000,000.
- **globalDefault**: If true, pods without an explicit Priority Class receive this priority.
- **preemptionPolicy**: Controls whether pods can preempt others (default: `PreemptLowerPriority`).

### Pod Priority Assignment

Pods reference a Priority Class via `priorityClassName` in the spec:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: highpriority-app
spec:
  priorityClassName: high-priority
  containers:
  - name: app
    image: myapp:latest
```

## Scheduling and Preemption Behavior

1. **Scheduling Order**: The scheduler places higher-priority pods first. If a high-priority pod cannot fit on any node, the scheduler checks if preemption is possible.

2. **Preemption Logic**: If enabled, the scheduler identifies the set of lower-priority pods on each node whose removal would allow the high-priority pod to fit. It evicts a minimal set of lower-priority pods to make room.

3. **Graceful Shutdown**: Evicted pods receive a grace period (default 30 seconds) to shut down cleanly before forcible termination.

4. **Pod Disruption Budget (PDB)**: PDBs can limit the number of pods that can be evicted simultaneously, protecting pod replicas during preemption.

## Best Practices

1. **Define explicit Priority Classes** for your workload tiers (system, critical, standard, low).
2. **Use minimum necessary priority values** to avoid unnecessary preemption cascades.
3. **Apply Pod Disruption Budgets** to critical workloads to ensure availability during preemption events.
4. **Monitor preemption events** in cluster logs to understand scheduling pressure and capacity.
5. **Test preemption behavior** in staging environments before production rollout.
6. **Document priority assignments** so teams understand relative pod importance.

## Proof-of-Concept Validation

This directory contains three separate manifest files:

- `priority-class.yaml` – PriorityClass resources defining priority levels
- `pods.yaml` – Example pods demonstrating different priority levels
- `pdb.yaml` – Pod Disruption Budget configurations for workload protection

### Validation Steps

Follow these steps to execute the POC in a Kubernetes cluster:

#### Step 1: Create Priority Classes

```bash
kubectl apply -f priority-class/priority-class.yaml
```

Verify Priority Classes were created:

```bash
kubectl get priorityclasses
```

Expected output:
```
NAME                     VALUE        GLOBAL-DEFAULT   AGE
high-priority            1000         false            1s
medium-priority          500          false            1s
low-priority             100          false            1s
system-cluster-critical  2000000000   false            1s
```

#### Step 2: Deploy Example Pods

```bash
kubectl apply -f priority-class/pods.yaml
```

Wait for all pods to reach `Running` status:

```bash
kubectl get pods -l app=priority-demo
```

Expected output:
```
NAME                   READY   STATUS    RESTARTS   AGE
high-priority-pod      1/1     Running   0          5s
medium-priority-pod    1/1     Running   0          5s
low-priority-pod       1/1     Running   0          5s
```

#### Step 3: Verify Pod Priority Assignment

Inspect each pod's priority:

```bash
kubectl describe pod high-priority-pod | grep -A1 Priority
kubectl describe pod medium-priority-pod | grep -A1 Priority
kubectl describe pod low-priority-pod | grep -A1 Priority
```

Expected output for high-priority-pod:
```
Priority:           1000
Priority Class Name: high-priority
```

#### Step 4: Apply Pod Disruption Budgets

```bash
kubectl apply -f priority-class/pdb.yaml
```

Verify PDBs were created:

```bash
kubectl get poddisruptionbudgets
```

Expected output:
```
NAME             MIN AVAILABLE   MAX UNAVAILABLE   ALLOWED DISRUPTIONS   AGE
critical-pdb     1               <unset>           0                     1s
standard-pdb     <unset>         1                 <unset>               1s
background-pdb   <unset>         50%               <unset>               1s
```

#### Step 5: Inspect Pod Disruption Budget Details

Check how many pods can be disrupted without violating PDB constraints:

```bash
kubectl describe pdb critical-pdb
kubectl describe pdb standard-pdb
kubectl describe pdb background-pdb
```

#### Step 6: Simulate Preemption (Optional)

To observe preemption in action, create resource pressure on the cluster. For example, deploy a high-priority pod with high resource requirements that cannot fit on available nodes:

```bash
# Monitor cluster events to watch for preemption
kubectl get events --sort-by='.lastTimestamp' -w
```

When a high-priority pod cannot be scheduled, you will see events indicating that lower-priority pods are being preempted.

#### Step 7: Verify Pod Events

Check if any pods were preempted or evicted:

```bash
kubectl describe pod low-priority-pod | grep -A5 "Events:"
```

Look for "Preempted by" or "Evicted" messages in the events.

## Advanced Configuration

### Pod Disruption Budget Example

To protect critical pods during preemption:

```yaml
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: critical-pdb
spec:
  minAvailable: 2
  selector:
    matchLabels:
      tier: critical
```

This ensures at least 2 pods with `tier: critical` label remain available at all times.

### Non-Preempting Priority Classes

If you want high-priority pods that do not preempt lower-priority pods:

```yaml
apiVersion: scheduling.k8s.io/v1
kind: PriorityClass
metadata:
  name: non-preempting-high
value: 1000
preemptionPolicy: Never
```

## Troubleshooting

- **Pods remain Pending**: Check cluster capacity and verify Priority Classes exist. Use `kubectl describe pod <name>` to inspect scheduling errors.
- **Unexpected Preemption**: Review pod priority values and PDBs. Check events: `kubectl get events --sort-by='.lastTimestamp'`.
- **Priority Class Not Found**: Ensure Priority Classes are created before pods reference them.
- **PDB prevents preemption**: If a pod cannot be preempted due to PDB constraints, higher-priority pods may remain pending. Consider adjusting PDB policies.

## Cleanup

To remove all resources created during the POC:

```bash
kubectl delete -f priority-class/pdb.yaml
kubectl delete -f priority-class/pods.yaml
kubectl delete -f priority-class/priority-class.yaml
```

## Conclusion

Pod Priority and Preemption are essential for multi-tenant and mixed-workload clusters. Proper configuration ensures critical applications are always scheduled and protected, while system resources are efficiently allocated across the cluster.
