# Dockerhub Commands

#### login to Dockerhub
```
docker login
```

#### pull image from Dockerhub
```
docker pull <image name>:<image version>
```

#### rename the tag of the local image 
```
docker tag <local image name>:<local image version> <dockerhub username>/<local image name>:<local image version>
docker tag hellokish:v1 kishalayb18/hellokish:v1
```

#### push the renamed image to the Dockerhub
```
docker push <dockerhub username>/<image name>:<image version>
```
