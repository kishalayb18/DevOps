


## Objective

Here we are trying to create multiple pods and one service. We are attaching the same label to each pod so that the pods can access the same service. After this when we will try to provide traffic to the particular service, it will distribute the traffic among the pods using the load balancing strategy. For the better understanding we have used different images in each pod, so that the output will be a prominent one.

### Commands
___

- Create namespace
```
kubectl apply -f namespace.yaml
kubectl get ns
```

- Create pods and service
```
kubectl apply -f pod1.yaml -n svc
kubectl apply -f pod2.yaml -n svc
kubectl apply -f service.yaml -n svc
```

```
kubectl get pods -n svc --watch
kubectl get pods -w -n svc
kubectl get pods -o wide -n svc

kubectl get service -w -n svc

kubectl get all -n svc
```

kubectl delete pods pod1 -n svc
kubectl delete pods pod2 -n svc

kubectl delete service/myservice -n svc

kubectl delete namespace svc
```

### To view the output in the browser
```
kubectl get nodes -o wide
```
- copy the internal IP from there _192.168.59.101_
- `<internal IP>:<nodePort port number>` _eg. 192.168.59.101:32000_
- paste it to the browser to see the result

minikube service