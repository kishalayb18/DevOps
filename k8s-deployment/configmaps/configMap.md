# Passing environment variables via confogMap
create the configmap and the deploymentfiles
`deployment-env.yaml` is the deployment where the configmap values wll be stored as the environment variables
`deployment-cm.yaml` is the deployment where the configmap values will be stored as the volumes
```
kubectl apply -f configmap.yaml -n sample
kubectl apply -f .\deployment-env.yaml
kubectl apply -f .\deployment-cm.yaml
```
check the configmaps, deployments get created with the proper configurations
```
kubectl get cm
kubectl describe cm dbconfig
kubectl get pods
```
go inside the `deployment-env` container to check the values of the environment variables
```
kubectl exec -it pods/deployment-env-767b984dd6-d8tgh -- /bin/bash
env | grep Db
```
go inside the `deployment-cm` container to check the values of the environment variables inside the specific mounted path
```
kubectl exec -it pods/deployment-cm-fcf44855f-vszjz -- /bin/bash
cat opt/db-port
cat opt/db-name
```
change the configmap `db-port` value from 3307 to 3309
```
kubectl edit cm dbconfig
```
check the `deployment-env` container see that Db-Port value `has not changed`
```
kubectl exec -it pods/deployment-env-767b984dd6-d8tgh -- /bin/bash
env | grep Db
```
check the `deployment-cm` container, see that db-port value is now `modified to 3309`
```
kubectl exec -it pods/deployment-cm-fcf44855f-vszjz -- /bin/bash
cat opt/db-port
cat opt/db-name
```

**those values that can be changed in future should always pass as the configmap volumes to the pods, when that is passed as environment variables, then it requires to restart the deployment to get those new values**