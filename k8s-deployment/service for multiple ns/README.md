# Multi-Namespace Service Communication (ns1 → ns2)

This setup demonstrates how a pod in **Namespace ns1** can call a service running in **Namespace ns2** using Kubernetes DNS. 


```bash
kubectl apply -f namespaces/ns1.yaml
kubectl apply -f namespaces/ns2.yaml

kubectl apply -f ns1/app1-deployment.yaml
kubectl apply -f ns2/app2-deployment.yaml
kubectl apply -f ns2/app2-service.yaml
```

kubectl exec -it deploy/app1 -n ns1 -- sh

wget -qO- http://app2-svc.ns2.svc.cluster.local

wget -qO- http://pod-name-app-service

wget -qO- http://10.244.0.32:5678
