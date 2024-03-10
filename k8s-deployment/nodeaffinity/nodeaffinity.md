### Steps to verify nodeaffiinity

1. create a multi node cluster

2. add several lables to the nodes
> small, medium, large

3. write the nodeaffinity section 

4. add random labels to the pods
> see the pod is getting scheduled to random nodes during the soft scheduling
> see the pod is in pending state during hard scheduling

5. attach righ label to the pod, see that it is getting scheduled to the node that matches the label


### Steps to verify pod affinity

1. add two nodes with same label

2. add the same labels to two pods

3. see both the pod secheduled in the same node, though there is a free node with matching label