# DOCKER

### What is Docker?
Docker is a platform that allows us to package our applications into deployable executables — called containers, with all its necessary OS libraries and dependencies
---
### Docker images
Docker images are light weight, standalone, executable package of software that includes everything needed(code, runtime, system tools, binaries, settings) to run an application

**to build a new image**
```
docker build -t <image name>:<image tag> .
```
> -t flag is used for tag, 
> hellokish will be the name of the Docker image, 
> v1 will be  the version of the Docker image, 
> "." is for signifying 

**to build a new image without the cache**
```
docker build -t <image name>:<image tag> . -no-cache
```

**List local images**
```
docker images
```
**to remove the docker image**
```
docker image rmi <image id>
```

**to forcibly remove docker image**
```
docker image rm -f <image id>
```
ways to delete the docker images
```
docker rmi <image id>
docker rmi <image id> <image id> <image id>
docker rmi <image id> -f
```

**to remove the unused docker images**
```
docker image prune
```

---

### Docker Container
The Docker Container is a runtime instance of a Docker image. A Docker container will always run the same, regardless of the infrastructure. Containers isolate software from its environment and ensure that it works uniformly despite differences for instance between development and staging environments.

**Create and run a Docker Container with custom name**
```
docker run --name <container name> <image name>:<image tag>
```

**Run a Docker Container and publish the container port to the host**
```
docker run --name <container name -p <host port>:<container port> <image name>:<image tag>
```

**Run a container in the background, detached mode**
```
docker run --name <container name> -d <image name>:<image tag>
```

**Provide environment variable while running a Docker Container**
```
docker run --name <container name> -e <ENV_VARIABLE>=<VALUE> <image name>:<image tag>
```
> sample command
> `docker run -e MYSQL_ROOT_PASSWORD=test@123 mysql`

**Scenario of Docker run command**
`docker  run --name=webserver -d -p 8000:80 nginx`
- -d will run this container in the detached mode,
- -p flag is for published the image port,
- 8000:80 > 8000 is the host machine port number, 80 is the application port number

**to list all the running Docker containers**
```
docker ps
```

**to list all the containers**
```
docker ps -a
```

**to get inside the docker container**
```
docker exec -it <docker container name> bash
```

**to stop the running docker container gracefully**
```
docker stop <container id or container name>
```

**to stop the Docker container forcibly**
```
docker kill <container id or container name>
```

**to remove a stopped docker container**
```
docker rm <docker container name or container id>
```

**to remove the unused containers**
```
docker system prune
```
> This will remove:
> all stopped containers
> all networks not used by at least one container
> all dangling images
> all dangling build cache

**fetch and follow logs of a docker container**
```
docker logs -f <docker container name or container id>
```

**to inspect a running docker container**
```
docker inspect <docker container name or container id>
```

**to view the resource  usage of a docker container**
```
docker container stats
```


### Dockerhub Commands
---

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