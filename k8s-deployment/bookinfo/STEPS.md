# BOOKINFO DEPLOYMENT

## Table of Contents
- [Platform Setup](#platform-setup)
- []()
- []()
- []()
- []()
- []()
- []()


## Platform Setup

Command to create the minikube cluster for configuring service mesh
```
minikube start --memory=4500 --cpus=4 --vm-driver=virtualbox
```
Follow this [documentation](https://istio.io/latest/docs/setup/platform-setup/minikube/#prerequisites) to setup the Istio service mesh

### Setup the ServiceMesh to the Cluster via Helm
Leveraged the Istio Helm repositories to configure the service mesh

#### Configur the Control Plane
Create the `istio-system` namespace to the cluster
```
kubectl create namespace istio-system
```
Configure the service mesh Control Plane
```
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update
helm install istio-base istio/base -n istio-system --set defaultRevision=default
helm install istiod istio/istiod -n istio-system --wait
```

Verify the components
```
helm ls -n istio-system
helm get all istio-base -n istio-system
helm status istiod -n istio-system
kubectl get deployments -n istio-system --output wide
```

#### Configure the Ingress Gateway Manually
Create a seperate namespace for the gateway
```
kubectl create namespace istio-ingress
```
Configure the gateway via Helm charts
```
helm install istio-ingress istio/gateway -n istio-system
```

Or leverage the gateway manifest
follow the [gatewat setup guide](https://istio.io/latest/docs/setup/additional-setup/gateway/)
> To apply a Gateway to these deployments, you need to select the istio=ingressgateway label
```
kubectl apply -f ingress.yaml -n istio-ingress
```

#### Gateway API CRDs
the Kubernetes Gateway API CRDs do not come installed by default on most Kubernetes clusters, so make sure they are installed before using the Gateway API
```
kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd?ref=v1.0.0" | kubectl apply -f -;
```

#### Clean up Commands
```
 helm uninstall istio-ingress -n istio-system
 helm uninstall istio-base  -n istio-system
 helm uninstall istiod -n  istio-system
```

## Setup the ServiceMesh to the Cluster via Istioctl

Follow the [documentation](https://vmacwrites.wordpress.com/2019/02/06/istio-on-windows-10/) for detailed guide to setup via service mesh via istoctl

#### Download Istio Binary on Windows

- Download the latest stable version of [Istio for windows zip](https://github.com/istio/istio/releases) and extract the contents.

#### Set the environment variable
- Copy the absolute path to the `bin` folder under the downloaded istio-<VERSION_NUMBER> folder
  e.g., C:/Users/Administrator/istio-1.0.5-win/istio-1.0.5/bin
- In the Search on the taskbar, look and open "Edit environment variables for my account".
- Under User variables, edit `path` environment variable and add a new entry pointing to the bin folder as copied above. Save the entries.

#### Test Istioctl
- Open command prompt and run ` istioctl`
- To Check the version, run `istioctl version`

#### Configure Servicemesh on the Cluster
```
istioctl install --set profile=demo -y
```

## Setup Bookinfo Deployments

Create the namespace that will host the application
```
kubectl create ns wrk-ops
```
Label the namespace with _istio-injection=enabled_ so that the istio sidecar can be injected in this namespace
```
kubectl label namespace wrk-ops istio-injection=enabled
```

Deploy the Bookinfo application
```
kubectl apply -f deploy.yaml -n wrk-ops
```
> Or follow the [workloads folder](workloads) and [networking folder](networking) forstep by step deployment

Verify the deployment is successful
```
kubectl get deployments -n wrk-ops
kubectl get pods -n wrk-ops
kubectl get service -n wrk-ops
kubectl get gateway -n wrk-ops
kubectl get virtualservice -n wrk-ops
```

To confirm that the Bookinfo application is running, send a request to it by a curl command from some pod, for example from ratings pod
```
kubectl exec -it pod/<rating pod> -n wrk-ops -- sh
curl -sS productpage:9080/productpage | grep -o "<title>.*</title>"
```

To get the Bookinfo page from the browser go to the `http://<minikube node ip>:<ingress gateway port for http>/productpage`
```
http://192.168.59.101:30317/productpage
```

## [Visualization: Kiali via Helm](https://kiali.io/docs/installation/quick-start/#install-via-helm)
To install the latest version of Kiali Server using Helm, run the following commands
```
helm repo add kiali https://kiali.org/helm-charts
helm repo update
helm install --namespace istio-system --set auth.strategy="anonymous" --repo https://kiali.org/helm-charts kiali-server kiali-server
istioctl dashboard kiali
```
To go to the Kiali dashboad
```
http://192.168.59.101:30880/productpage
```
> replace `192.168.59.101` with the minikube node ip, run `minikube ip` command to fetch this

- To uninstall
```
helm uninstall --namespace istio-system kiali-server
```