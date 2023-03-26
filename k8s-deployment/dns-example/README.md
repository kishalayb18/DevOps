
_F:\Documents\Coding\DevOps\k8s-deployment_

## Objective
> Here we are trying to create two namespaces. 
In the first namespace we are creating a pod and a service. 
In the second namespace we will create a pod (in real life it can a database or web server). 
After this we will try to access the service from the pod hosted in the second namespace. The important part to remember here is, both the pods should have the same label as the label of the service.
This will demonstrate that the DNS gets created by default when the service gets created and other pods from other namespaces can also access the service.

### Commands
___

```
kubectl create ns first-ns
kubectl create ns second-ns

kubectl get ns

kubectl apply -f pod1.yaml -n first-ns
kubectl apply -f service.yaml -n first-ns
kubectl apply -f pod2.yaml -n second-ns

kubectl get pods --all-namespaces // to get the pods all the namespaces
kubectl get pods -A // to get the pods all the namespaces

kubectl get service -w -n first-ns

#to get inside of a pod
kubectl exec <pod name> -c <container name> -n <namespace name> -it bash
kubectl exec first-pod -c sample-container-1 -n first-ns -it bash

kubectl delete pods pod1 -n svc
kubectl delete pods pod2 -n svc

kubectl delete service/myservice -n svc

kubectl delete namespace first-ns
kubectl delete ns second-ns
```

### To view the output in the browser
```
kubectl get nodes -o wide
```
- copy the internal IP from there _192.168.59.101_
- `<internal IP>:<nodePort port number>` _eg. 192.168.59.101:32000_
- paste it to the browser to see the result