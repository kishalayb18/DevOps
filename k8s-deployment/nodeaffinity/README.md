## Steps to verify nodeaffiinity

1. Create a multi-node cluster

2. Add lables to the nodes `kubectl label nodes <node-name> <label-key>=<label-value>`
```
kubectl label nodes wmh-worker priority=high
kubectl label nodes wmh-worker2 priority=medium
kubectl label nodes wmh-worker3 priority=low
```
> label key here is _priority_, values _high_, _medium_, _low_

```
kubectl label nodes wmh-worker zone=wh-1
kubectl label nodes wmh-worker2 zone=wm-2
kubectl label nodes wmh-worker3 zone=wl-3
```

3. Write the nodeaffinity section
```
affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: priority
            operator: In
            values:
            - medium
```

4. Give random labels in the node affinity `matchExpressions` section
- see the pod is getting scheduled to random nodes during the soft scheduling (_preferredDuringSchedulingIgnoredDuringExecution_)
- see the pod is in pending state during hard scheduling (_requiredDuringSchedulingIgnoredDuringExecution_)
` Warning  FailedScheduling  9s (x2 over 5m19s)  default-scheduler  0/4 nodes are available: 1 node(s) had untolerated taint {node-role.kubernetes.io/control-plane: }, 3 node(s) didn't match Pod's node affinity/selector. preemption: 0/4 nodes are available: 4 Preemption is not helpful for scheduling`

5. Attach righ label to the  `matchExpressions` section, see that it is getting scheduled to the node that matches the label
```
kubectl get pod -o wide
```


## Steps to verify pod affinity

1. add two nodes with same label

2. add the same labels to two pods

3. see both the pod secheduled in the same node, though there is a free node with matching label