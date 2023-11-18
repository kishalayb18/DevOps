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
> -t flag is used for tag, 
> hellokish will be the name of the Docker image, 
> v1 will be  the version of the Docker image, 
> "." is for signifying 

- -e tag is for the environment variable
```
docker run -e MYSQL_ROOT_PASSWORD=test@123
```

- create custom container name with --name
```
docker  run --name=webserver -d -p 8000:80 nginx
```
> -d will run this container in the detached mode,
> -p flag is for published the image port,
> 8000:80 > 8000 is the host machine port number, 80 is the application port number

- to get inside the docker container
```
docker exec -it <docker container name> bash
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

    docker rmi <image id>
    docker rmi <image id> <image id> <image id>
    docker rmi <image id> -f

- to remove stopped containers
```
docker system prune
```
> This will remove:
> all stopped containers
> all networks not used by at least one container
> all dangling images
> all dangling build cache


### Dockerhub Commands

- login to Dockerhub
```
docker login
```

- pull image from Dockerhub
```
docker pull <image name>:<image version>
```

- rename the tag of the local image 
```
docker tag <local image name>:<local image version> <dockerhub username>/<local image name>:<local image version>
docker tag hellokish:v1 kishalayb18/hellokish:v1
```

- push the renamed image to the Dockerhub
```
docker push <dockerhub username>/<image name>:<image version>
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
