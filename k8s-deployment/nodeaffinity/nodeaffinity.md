### Steps

1. create a multi node cluster

2. add several lables to the nodes
> size, micro, small, medium, large

3. write the nodeaffinity section 

4. add random labels to the pods
> see the pod is getting scheduled to random nodes during the soft scheduling
> see the pod is in pending state during hard scheduling

5. attach righ label to the pod, see that it is getting scheduled to the node that matches the label