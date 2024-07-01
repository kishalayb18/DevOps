# Python Flask Microservice Deployment

## Folder Structure

There are two folders here, _application_ folder and the _deployment-manifests_ folder

- Application folder contains the files related to the application code, the libraries to run the application, the Dockefile to containerize the application

- the deployment-manifests contains the kubernetes deployment files

## Containerization

- Build the image to containerized

```Dockerfile
docker build -t flask-names:v1 .
```

- Push the image to the Docker Repository

```Dockerfile
docker tag flask-names:v1 kishalayb18/flask-names:v1
docker push kishalayb18/flask-names:v1
```
