# Setting Up Sample Application with Ingress on Minikube
This guide will walk you through deploying an Nginx application on Minikube, exposing it as a ClusterIP service, and configuring Ingress to access the service via a browser.

## Prerequisites
Minikube installed on Docker Driver
kubectl installed on Windows.

## Step 1: Start Minikube and Enable Ingress
Started Minikube and enabled the Ingress, ingress dns
```
minikube start
minikube addons enable ingress
minikube addons enable ingress-dns
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
- To access the service using the host you need to update your hosts file,
```
cd /etc
sudo vi hosts
```
- Add the following entry, `127.0.0.1    kishalay.com`
> for Mac do not map the hostname with minikube ip
> hostname in the ingress file should match the hostname mapped with the ip here
- Run _minikube tunnel_
- Open your browser and navigate to http://kishalay.com to get the application on browser

Started Minikube and enabled the Ingress addon.
Deployed the application.
Exposed the application as a ClusterIP service.
Configured an Ingress resource to route traffic to the service.
Updated the hosts file to access the service via a browser.