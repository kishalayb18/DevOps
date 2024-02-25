## Setup Jenkins on Minikube

[video tuitorial](https://youtu.be/_r-C_FFDLmU?si=zoS_TsLdihggc7Ir)

1. create jenkins namespace on minikube
```
kubectl create ns jenkins
```

2. deploy the following files
```
kubectl apply -f .\jenkins-deployment.yaml -f .\jenkins-service.yaml -n jenkins
```
3. to get the minikube node ip
```
minikube ip
```
4. to get the service's node port
```
kubectl get svc -n jenkins
```
5. open the Jenkins on browser
```
<mnikube node ip>:<service node port>
6. to get the **initialAdminPassword** check the pod logs
```
kubectl logs pod/<pod name> -n jenkins
```

kubectl create clusterrolebinding jenkins --clusterrole cluster-admin --serviceaccount=jenkins:default