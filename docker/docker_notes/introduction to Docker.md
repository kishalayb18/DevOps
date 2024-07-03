# Introduction to Docker

## What is Docker?
Docker is a platform that allows us to package our applications into deployable executables, called containers, with all its necessary OS libraries and dependencies

## Docker images
Docker images are light weight, standalone, executable package of software that includes everything needed(code, runtime, system tools, binaries, settings) to run an application

## Docker Engine  
Docker Engine::   
1. Docker Daemon  
2. REST API  
3. Docker CLI  

### Docker Dameon  
It is a background process that manages docker objects such as the images, containers, volumes and networks.  

### REST API  
It is an API interface that programs can use to talk to the daemon and provide the instructions.  

### Docker CLI  
A command line interface (CLI), Where we are running the docker commands such as managing images, stopping or starting contaniers, and so on.  

## Docker File Inastructions  

***
| Instruction | Argument |  
|:-----|:------:|  
|FROM       |    Start from a base OS or another Image  |
|LABEL      |    Adding labels to the container    |
|RUN        |    Install All dependecies      |
|WORKDIR    |    Changing the source directory    |
|COPY       |    Sopy Source Code    |
|CMD        |    Commands to execute    |
*** 

  
