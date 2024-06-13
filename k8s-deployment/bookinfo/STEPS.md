# [Platform Setup](https://istio.io/latest/docs/setup/platform-setup/minikube/#prerequisites)

```
minikube start --memory=4500 --cpus=4 --vm-driver=virtualbox
```

# Setup the ServiceMesh to the Cluster
```
helm repo add istio https://istio-release.storage.googleapis.com/charts

helm repo update

kubectl create namespace istio-system

helm install istio-base istio/base -n istio-system --set defaultRevision=default

helm get all istio-base -n istio-system

helm ls -n istio-system

helm install istiod istio/istiod -n istio-system --wait

helm ls -n istio-system

helm status istiod -n istio-system

kubectl get deployments -n istio-system --output wide

kubectl create namespace istio-ingress

helm install istio-ingress istio/gateway -n istio-system

 helm uninstall istio-ingress -n istio-system
```

# [Setup Istioctl](https://vmacwrites.wordpress.com/2019/02/06/istio-on-windows-10/)

### Download Istio

- Download the latest stable version of [Istio for windows zip](https://github.com/istio/istio/releases) and extract the contents.

### Set the environment variable
- Copy the absolute path to the `bin` folder under the downloaded istio-<VERSION_NUMBER> folder
  e.g., C:/Users/Administrator/istio-1.0.5-win/istio-1.0.5/bin
- In the Search on the taskbar, look and open "Edit environment variables for my account".
- Under User variables, edit `path` environment variable and add a new entry pointing to the bin folder as copied above. Save the entries.

### Test Istioctl
- Open command prompt and run ` istioctl`
- To Check the version, run `istioctl version`


# [Setup Gateways](https://istio.io/latest/docs/setup/additional-setup/gateway/)
```
kubectl create namespace istio-ingress
kubectl apply -f ingress.yaml -n istio-ingress
```

- To apply a Gateway to these deployments, you need to select the istio=ingressgateway label

# Setup Bookinfo Deployments
Label the namespace that will host the application with _istio-injection=enabled_
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

# [try Kiali via Helm](https://kiali.io/docs/installation/quick-start/#install-via-helm)
To install the latest version of Kiali Server using Helm, run the following commands
```
helm repo add kiali https://kiali.org/helm-charts
helm repo update
helm install --namespace istio-system --set auth.strategy="anonymous" --repo https://kiali.org/helm-charts kiali-server kiali-server
 istioctl dashboard kiali
 ```
 
 - To uninstall
 ```
helm uninstall --namespace istio-system kiali-server
 ```

http://192.168.59.101:30880/productpage

31473
31417
30880