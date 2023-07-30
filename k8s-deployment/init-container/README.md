
```
kubectl apply -f namespace.yaml

kubectl get ns

kubectl apply -f deployment.yaml -n k8s-dev

kubectl get deployment -n k8s-dev

kubectl apply -f service.yaml -n k8s-dev

kubectl get pods -n k8s-dev --watch

kubectl get all -n k8s-dev


kubectl delete deployment static-sample-deployment -n k8s-dev

kubectl delete service/sample-static-service -n k8s-dev

kubectl delete namespace k8s-dev
```