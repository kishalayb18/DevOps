#Deploy Single Container Application
_____________________________________

##Pre requisites
    > minikube
    >kubectl binaries

##minikube Commands
    start minikube --vm-driver=virualbox #for the first time
    minikube start #to resume minikube
    minikube status
    minikube stop
    minikube delete #need not to use this command if you want to resume minikube later

##Files Required
    namespace.yaml
    deployment.yaml
    service.yaml

##Image Used
    > nginx

##kubectl Commands

    kubectl apply -f namespace.yaml
    kubectl get ns

    kubectl apply -f deployment.yaml -n sample
    kubectl get deployment -n sample

    kubectl apply -f service.yaml -n sample
    kubectl get pods -n sample

    kubectl get all -n sample

    kubectl delete deployment.apps/static-sample-deployment -n sample
    kubectl delete service/sample-static-service -n sample
    kubectl delete namespace sample
