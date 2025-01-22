docker build -t kishalayb18/podname:v1 .
docker push kishalayb18/podname:v1
docker run -dp 5001:5000 kishalayb18/podname:v1