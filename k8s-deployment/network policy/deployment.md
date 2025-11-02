# Kubernetes Three-Tier App Deployment Commands

## Step 1: Apply Namespaces
```sh
kubectl apply -f namespaces.yaml
```

## Step 2: Apply Deployments
```sh
kubectl apply -f deployments.yaml
```

## Step 3: Apply Services
```sh
kubectl apply -f service.yaml
```

## Step 4: Apply NetworkPolicies
```sh
kubectl apply -f networkpolicies.yaml
```

---

## Step 5: Verify Pods
```sh
kubectl get pods -n fe-ns
kubectl get pods -n be-ns
kubectl get pods -n db-ns
```

---

## Step 6: Test Connectivity

### From Frontend Pod
```sh
kubectl exec -it -n fe-ns deploy/frontend -- sh
```

```sh
curl backend.be-ns.svc.cluster.local   
curl database.db-ns.svc.cluster.local  
exit
```

---

### From Backend Pod
```sh
kubectl exec -it -n be-ns deploy/backend -- sh
```

```sh
curl database.db-ns.svc.cluster.local  
exit
```

---

### From Database Pod
```sh
kubectl exec -it -n db-ns deploy/database -- sh
```

```sh
curl frontend.fe-ns.svc.cluster.local  
exit
```

---

## Step 7: Clean Up
```sh
kubectl delete -f networkpolicies.yaml
kubectl delete -f services.yaml
kubectl delete -f deployments.yaml
kubectl delete -f namespaces.yaml
```
