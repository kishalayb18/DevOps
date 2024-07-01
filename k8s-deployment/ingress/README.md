# Setting Up Sample Application with Ingress on Minikube
This guide will walk you through deploying an Nginx application on Minikube, exposing it as a ClusterIP service, and configuring Ingress to access the service via a browser.

## Prerequisites
Minikube installed on Windows.
kubectl installed on Windows.

## Step 1: Start Minikube and Enable Ingress
Started Minikube and enabled the Ingress addon
```
minikube start
minikube addons enable ingress
```

## Step 2: Create Deployment, Service and the ingress resources using the YAML Files
Follow the deployment, service, ingress yaml files in this very folder.
- create a seperate namespace
```
kubectl create ns page-tst
```
- Deployed the application.
```
kubectl apply -f deployment.yaml -n page-tst
```
- Exposed the application as a ClusterIP service.
```
kubectl apply -f service.yaml -n page-tst
```
- Configured an Ingress resource to route traffic to the service.
```
kubectl apply -f ingress.yaml -n page-tst
```

## Step 3: Update the Hosts File
- get the minikube ip
```
minikube ip
```
- To access the service using the host you need to update your hosts file,
> location of the host file: _C:\Windows\System32\drivers\etc\hosts_
- Add the following entry, `192.168.30.57    kishalay.com`
> replace the ip with the minikube ip
> hostname in the ingress file should match the hostname mapped with the ip here
- Open your browser and navigate to http://kishalay.com to get the application on browser

Started Minikube and enabled the Ingress addon.
Deployed the application.
Exposed the application as a ClusterIP service.
Configured an Ingress resource to route traffic to the service.
Updated the hosts file to access the service via a browser.