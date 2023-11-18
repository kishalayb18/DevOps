# DOCKER COMMANDS

### Docker List, Build, Run

- to list all the running Docker containers
```
docker ps
```

- to list all the running Docker images
```
docker images
```

- to create a new image
```
docker build -t hellokish:v1 .
```
> -t flag is used for tag
> hellokish will be the name of the Docker image
> v1 will be  the version of the Docker image

- -e tag is for the environment variable
```
docker run -e MYSQL_ROOT_PASSWORD=test@123
```

### Stop and Remove the Docker containers, Docker images

- to stop the running docker container
```
docker stop <container id>
```

to remove the Docker container
```
docker kill <container id>
```
> "docker images" will show the docker container id, docker images id

- to remove all the stopped containers
```
docker system prune
```

- to remove the docker image
```
docker rmi <image id>
docker rmi <image id> <image id> <image id>
docker rmi <image id> -f
```

### Dockerhub Commands

- login to Dockerhub
```
docker login
```

- pull image from Dockerhub
```
docker pull <image name>:<image version>
```

- push image to Dockerhub
```
docker tag <local image name>:<local image version> <dockerhub username>/<local image name>:<local image version>
docker tag hellokish:v1 kishalayb18/hellokish:v1
```


```
```
```
```
```
```
```
```
```
```
```
```
```
```
