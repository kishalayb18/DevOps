docker build -t kishalayb18/podname:v2 .
docker push kishalayb18/podname:v2
docker run -dp 5001:5000 kishalayb18/podname:v1

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

minikube service