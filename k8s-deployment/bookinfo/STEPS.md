### [Platform Setup](https://istio.io/latest/docs/setup/platform-setup/minikube/#prerequisites)

```
minikube start --memory=4500 --cpus=4 --vm-driver=virtualbox
```
Label the namespace that will host the application with istio-injection=enabled
```
kubectl create ns wrk-ops
kubectl label namespace wrk-ops istio-injection=enabled
```

the Kubernetes Gateway API CRDs do not come installed by default on most Kubernetes clusters, so make sure they are installed before using the Gateway API
```
kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd?ref=v1.0.0" | kubectl apply -f -;
```

Deploy your application using the kubectl command
```
kubectl apply -f deploy.yaml -n wrk-ops
```

To confirm that the Bookinfo application is running, send a request to it by a curl command from some pod, for example from ratings pod
```
kubectl exec -it pod/<rating pod> -n wrk-ops -- sh
curl -sS productpage:9080/productpage | grep -o "<title>.*</title>"
```

kubectl get deployments -n wrk-ops

helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update

kubectl create namespace istio-system

helm install istio-base istio/base -n istio-system --set defaultRevision=default

helm get all istio-base -n  istio-system

helm ls -n istio-system

helm install istiod istio/istiod -n istio-system --wait

helm ls -n istio-system

helm status istiod -n istio-system

kubectl get deployments -n istio-system --output wide

kubectl create namespace istio-ingress
helm install istio-ingress istio/gateway -n istio-ingress --wait


### [Setup Gateways](https://istio.io/latest/docs/setup/additional-setup/gateway/)
```
kubectl create namespace istio-ingress
kubectl apply -f ingress.yaml -n istio-ingress

```

To apply a Gateway to these deployments, you need to select the istio=ingressgateway label

