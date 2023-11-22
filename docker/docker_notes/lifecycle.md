### What is Docker Container Lifecycle?
A container is a process in OS. A process is an instance of a computer program that is being executed. But container processes are different. Container processes are fully-functional environments, and they have more isolation from the OS than the processes in OS.
Just like processes, containers have different states throughout their lifecycle. There are mainly five states that a container can be in during its lifecycle -

1. Created state
2. Running state
3. Paused state/ Unpaused state
4. Stopped state
5. Killed/Deleted state

![docker container lifecycle](https://media.licdn.com/dms/image/D4D22AQEbeCgjiT7F3w/feedshare-shrink_800/0/1700393481062?e=1703116800&v=beta&t=bV3Bgw2eZVyh-H7sEVcShVG4Emd_AS_wc264yzj0vco)

---

## Different states of Docker Container Lifecycle

#### Created state
The very first state in the lifecycle, after you are done with building the docker image, is the Created state. In this phase, a docker container is created from a docker image.
```
docker create --name=mycontainer <docker image name>:<docker image tag>
```
#### Running state
In the running phase, a docker container is running actively. This means the commands listed in the image are being executed one by one by the container.
A container that has been created by the `docker create` command or stopped can be started using the `docker start` command
    docker start <container-id or container-name>

When a container is not created and we want to create a container as well as run it at the same time, we can directly use the docker run command
```
docker run <container-id or container-name>
```

#### Paused / Unpaused state
The `docker pause` command effectively freezes or suspends all the processes running in a container. When in a paused state, the container is unaware of its state. It basically sends the **SIGSTOP** signal to pause the processes in the container.
```
docker pause container <container-id or container-name>
```

Similarly, to get the paused container back on running, we’d use the `docker unpause` command
```
docker unpause container <container-id or container-name>
```

#### Stopped state
When a container is stopped, its main process stops running immediately. When stopped, the disk portion of the state is persisted, that means saved.
The main difference between the paused and stopped states is that the memory portion of the state is cleared when a container is stopped, whereas, in the paused state, its memory portion stays intact.

When the `docker stop` command is executed, the main container process receives a **SIGTERM** signal (by default), and after a **Grace Period** (default 10s as of writing), it receives a **SIGKILL** signal
```
docker stop <container-id or container-name>
```

#### Killed / Deleted state
For a container to be in a killed state, we run the _docker kill_ command, which sends **SIGKILL** signals to terminate the main process immediately. **This means the difference between docker stop and docker kill is that - stop can allow safe termination (within the grace period) while kill terminates immediately.**
```
docker kill <container-id or container-name>
```

A container that is in the created state or stopped can be removed with `docker rm`. This will result in the removal of all data associated with the container like the processes, file system, volume & network mappings
```
docker rm <container-id or container-name>
```

#### What are SIGTERM and SIGKILL signals?
The **SIGTERM** and **SIGKILL** signals are **POSIX** signals which are a standard way of an OS telling a child process how to behave. **SIGTERM** is sent to a process to request its termination. This allows the process to perform graceful termination, releasing resources and saving state if appropriate. **SIGKILL** is sent to terminate a process immediately. Unlike **SIGTERM**, this signal cannot be caught or ignored, and the receiving process cannot perform any clean-up upon receiving this signal.
