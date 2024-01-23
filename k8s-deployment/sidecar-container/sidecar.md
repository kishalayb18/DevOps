to get inside webapplication container
```
kubectl exec -it pod/sidecar-deployment-5dc6c4c49b-fkrk2 -n skill -c webapplication -- sh
```

to get inside sidecar container
```
 kubectl exec -it pod/sidecar-deployment-5dc6c4c49b-fkrk2 -n skill -c sidecar -- sh
```