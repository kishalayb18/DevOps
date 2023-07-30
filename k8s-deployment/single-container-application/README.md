# Deploy Single Container Application
_____________________________________

## Pre requisites
- minikube
- kubectl binaries

## minikube Commands
```
#for the first time
start minikube --vm-driver=virualbox 
minikube start --no-vtx-check

minikube start #to resume minikube

minikube status

minikube stop

#need not to use this command if you want to resume minikube later
minikube delete 

```

## Files Required
- namespace.yaml
- deployment.yaml
- service.yaml

## Image Used
``` 
nginx 
```

## kubectl Commands

```
kubectl apply -f namespace.yaml

kubectl get ns

kubectl apply -f deployment.yaml -n sample

kubectl get deployment -n sample

kubectl apply -f service.yaml -n sample

kubectl get pods -o watch -n sample

kubectl get all -n sample


kubectl delete deployment.apps/static-sample-deployment -n sample

kubectl delete service/sample-static-service -n sample

kubectl delete namespace sample
```
_______________________________________________________________________