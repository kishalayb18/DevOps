# wishlist db

## Connect to GKE

## Pre-requisites

1. helm
2. gcloud CLI

## Steps

kubectl create namespace ingress-nginx

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm repo update

helm install my-release ingress-nginx/ingress-nginx -n ingress-nginx

kubectl create secret generic pgpassword --from-literal PGPASSWORD=hello_flask -n ps