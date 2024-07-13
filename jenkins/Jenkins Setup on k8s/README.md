## Setup Jenkins on Minikube

[video tuitorial](https://youtu.be/_r-C_FFDLmU?si=zoS_TsLdihggc7Ir)
[document](https://www.jenkins.io/doc/book/installing/kubernetes/#jenkins-kubernetes-manifest-files)

1. create jenkins namespace on minikube
```sh
kubectl create ns jenkins-local
```

2. deploy the following files
```sh
kubectl apply -f jenkins-storageclass.yaml -f jenkins-pv.yaml -f jenkins-pvc.yaml -f jenkins-sa-role.yaml  .\jenkins-deployment.yaml -f .\jenkins-service.yaml -n jenkins-local
```
3. to get the node ip
```sh
kubectl get node -o wide
```
4. to get the service's node port
```sh
kubectl get svc -n jenkins-local
```
5. open the Jenkins on browser
> <node ip>:<service node port>

6. to get the **initialAdminPassword** check the pod logs

```sh
kubectl logs pod/<pod name> -n jenkins-local
```
