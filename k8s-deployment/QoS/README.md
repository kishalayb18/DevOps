# Kubernetes Quality of Service (QoS) Guide

This document provides a formal overview of Kubernetes Quality of Service (QoS) classes and their implications for resource allocation and pod scheduling. It is intended for architects and operators planning deployments that must meet defined performance and reliability targets.

## Overview

Kubernetes categorizes pods into QoS classes based on the resource requests and limits specified for each container. QoS classes influence eviction order and scheduling priorities when resources become constrained.

The primary QoS classes are:

- **Guaranteed**: All containers in the pod have memory and CPU limits set equal to their requests. This class provides the highest scheduling priority and eviction protection.
- **Burstable**: Pods with at least one container that has a request lower than its limit fall into this class. Resources are guaranteed at the requested level, with the ability to burst up to the specified limits.
- **BestEffort**: Pods that do not specify any resource requests or limits. These are the first to be evicted under resource pressure and receive no guaranteed resources.

## Resource Specification

To influence QoS classification, define resources in the pod or container specification as follows:

```yaml
resources:
  requests:
    cpu: "100m"
    memory: "256Mi"
  limits:
    cpu: "200m"
    memory: "512Mi"
```

Setting identical requests and limits on all containers yields the Guaranteed class. Mixed or partial specifications result in Burstable or BestEffort.

## Scheduling and Eviction Behavior

- **Guaranteed pods** are scheduled preferentially and are the last to be evicted when nodes are under memory or CPU pressure.
- **Burstable pods** have moderate priority; eviction depends on request utilization and node resource availability.
- **BestEffort pods** are the first candidates for eviction and may be throttled by the kubelet to free resources.

## Best Practices

1. **Specify requests and limits** for all production workloads to avoid unanticipated throttling or eviction.
2. **Align limits with expected usage**; overly high limits may reduce cluster efficiency, while low limits can cause throttling.
3. **Use Guaranteed QoS** for critical services requiring consistent performance.
4. **Monitor resource usage** and adjust specifications to maintain desired QoS and cluster stability.

## Proof‑of‑Concept Validation

Refer to the external manifest file `pods.yaml` in the same directory; it contains three pods demonstrating one example of each QoS class.
### Validation Steps

To perform the proof‑of‑concept, run the following steps in a cluster:

1. Apply the manifest file:

    ```bash
    kubectl apply -f pods.yaml
    ```

2. Wait for the pods to reach `Running` status:

    ```bash
    kubectl get pods qos-guaranteed qos-burstable qos-besteffort
    ```

   All three should show `STATUS` as `Running` once scheduled.

3. Verify their QoS classes:

    ```bash
    kubectl get pods qos-guaranteed qos-burstable qos-besteffort \
      -o custom-columns=NAME:.metadata.name,QOS:.status.qosClass
    ```

   Expected result:
    ```
    NAME              QOS
    qos-guaranteed    Guaranteed
    qos-burstable     Burstable
    qos-besteffort    BestEffort
    ```

4. Describe an individual pod to inspect resource settings:

    ```bash
    kubectl describe pod qos-guaranteed | grep -A2 QoS
    ```

5. (Optional) Create resource pressure on the node and observe eviction order to see the scheduler's behavior.

These steps reference the external `pods.yaml` so you can update or extend it without modifying the README.

## Conclusion

Understanding and applying QoS classes is essential for designing robust Kubernetes deployments. Proper resource definitions ensure predictable behavior under load and allow the cluster scheduler to make informed decisions.
