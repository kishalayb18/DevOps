# Docker Commands  
1. [ Image ](#image)  
2. [ System ](#system)
2. [ Container ](#container)
3. [ Running Container ](#run)
4. [ Container Exec ](#exec)
5. [ Image Build & Tag ](#build)
6. [ Nginx Container ](#nginx)  
7. [ Args & Environment Variables ](#args)  
7. [ Logs ](#logs)  
---  
<a name="image"></a>
## Image  

### Pull – download an image  
```
docker run nginx:<version>   
docker pull nginx:<version>   
```

### images - List images  
```
docker images
```  

### rmi - Remove Images  
```
docker rmi <imagename:tag>
```  

### to remove all unused images  
```
docker image prune -a
```

### to delete all images  
```
docker rmi $(docker images -a)  
```

---
<a name="system"></a>  
## System  
Docker provides a single command that will clean up any resources — images, containers, volumes, and networks — that are dangling (not associated with a container):  
```
docker system prune
```

To additionally remove any stopped containers and all unused images (not just dangling images), add the -a flag to the command:
```
docker system prune -a
```  

### docker login  
This command is used to login to the docker hub repository  
```
Usage: docker login [REGISTRY_URL]
```  

### Docker Logout   
This command is used to log out or remove the credentials used to authenticate with a Docker registry.    
```
Usage: docker logout [REGISTRY_URL]
```  
 
### Docker network  
This command manages Docker networks. Docker networks enable containers to connect securely and isolatedly with one another and with external network resources.  
```
Usage: docker network create <network_name>
```

### Docker volume  
This command creates a new Docker volume named “my_volume” in the Docker container. Volumes in Docker are generated independently of containers.  
```
Usage: docker volume create <volume-name>
```



---  
<a name="container"></a>
## Container  

### Run - Start a container  
```
docker run nginx:<version>
```  

### ps – list containers  
```
#to list running containers  
docker ps  
#to list all containers including non running  
docker ps -a
```  

### STOP – stop a container docker  
```
docker stop <container-id> 
```  

### START – start a container docker  
```
docker start <container-id> 
```  

### Inspect container  
```
docker inspect <container-id>
```

### Rm – Remove a container  
```
docker rm <container-id>
``` 

### To delete containers which are in exited state  
```
docker rm $(docker ps -a -f status=exited -q)
```  

### To delete containers which are in created state  
```
docker rm $(docker ps -a -f status=created -q)
```

### To stop all running containers  
```
docker stop $(docker ps -q)
```
---
<a name="run"></a>
## Run Container
### Append a command  
```
docker run ubuntu sleep 5
```  

### Run - Attache & Detach  
docker run will run the command in attach or foreground mode  
```
docker run <image> 
```

docker run -d will run the container in dettach or background mode  
```
docker run -d <image>
```

### Naming container
```
docker run -d --name <container-name> <image-name>  
```

### Running container on specific port  
```
docker run -d -p <host_port>:<container_port> --name <container-name> <image-name>  
```

### to pass environment variables to container  
```
docker run -p 3<host_port>:<container_port> --name <container-name> <image-name> -e <variable_name>=<value>
``` 

---  

<a name="exec"></a>
## Container Login  

### Exec - execute command on running container  
```
docker exec <container-id>  cat /etc/hosts  
```  

### Login to running container  
```
docker exec -it <container-id> bash  
```  

### Login to container  by running  
```
docker run -it <image> bash  
```

---  

<a name="build"></a>
## Image Build & Tag  

### Use below command to build image  
```
docker build --tag "<image-name>:<image-tag>" --file "/path/to/Dockerfile" .
```

### to tag the current image with different tag  
```
docker tag <image-name>:<current-tag> <image-name>:<new=tag>
```

### docker commit  
This command creates a new image of an edited container on the local system  
```
Usage: docker commit <conatainer id> <username/imagename>  
```

### Docker history  
Using this command, you may examine the evolution of a Docker image or its constituent parts.  
```
Usage: docker history <image_name>  
```
  
---

<a name="nginx"></a>
## Nginx  container

### Source conf  
Paths::  
source configuration  
```
/etc/nginx/conf.d  
```
webpage path  
```
/usr/share/nginx/html  
```


#nginx conf  
```
/etc/nginx/nginx.conf  
```

---

<a name="args"></a>  

## Args & Environement Variables   

> **_NOTE:_** The ARG arguments are only available when building the image, while ENV parameters are available to the application containers during build and when the container is running. 

### passing arguments  
```
docker build -t [image-name] --build-arg [arg-variable]=[value] .
``` 

### passing environment variables  
```
docker run --name [container-name] -e "[variable-name]=[new-value]" [image-name]
```  

### passing environment variables file  
```
docker run --name [container-name] --env-file [path-to-env-file] [image-name]
```  

---  

<a name="logs"></a>  
## Logs  

## to get the container logs  
```
docker logs <container-id>
``` 

## to get the all the activities from docker container  
```
docker logs <container-id>  --details
```  
