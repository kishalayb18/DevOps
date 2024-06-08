## Introduction
Kubernetes, also known as K8s, is an open-source container orchestration platform designed to automate the deployment, scaling, and management of containerized applications. It groups containers into logical units for easy management and discovery, ensuring high availability and scalability. Kubernetes provides a robust platform for managing containerized applications, offering powerful abstractions to ensure applications are scalable, resilient, and easy to manage. Understanding the basic architecture and concepts is essential for effectively leveraging Kubernetes in the projects


## Architecture

![image](https://user-images.githubusercontent.com/115966808/227559209-95505f77-2017-4266-8d47-14bb273e490b.png)  

### Master Node Components
The master node is responsible for managing the Kubernetes cluster. It oversees the nodes and the pods running within the cluster. Key components of the master node include:

- **API Server:** Exposes the Kubernetes API, acting as the front end for the Kubernetes control plane.
- **Etcd:** A consistent and highly-available key-value store used for all cluster data.
- **Scheduler:** Assigns workloads to the worker nodes based on resource availability.
- **Controller Manager:** Runs controller processes to regulate the state of the cluster, handling tasks like node failures and endpoint management.
- **Cloud Controller Manager:** Manages cloud-specific controller processes.

### Worker Node Components
Worker nodes run the applications and handle the containerized workloads. Each worker node has its own set of components:

- **Kubelet:** Ensures that containers are running in a pod by communicating with the master node.
- **Kube-proxy:** Maintains network rules and handles network communication within and outside the cluster.
- **Container Runtime:** Runs the containers. Common runtimes include Docker, containerd, and CRI-O.

## Basic Concepts

### Pods
Pods are the smallest deployable units in Kubernetes, representing a single instance of a running process. They encapsulate one or more containers, storage resources, a unique network IP, and options for how the containers should run.

### Services
Services provide stable endpoints for accessing the running pods. They enable communication between different parts of an application and can expose the application to external traffic.

### Volumes
Volumes offer persistent storage that pods can use. Unlike containers, which are ephemeral, volumes retain data even after a pod is terminated.

### Namespaces
Namespaces are a way to divide cluster resources between multiple users. They provide scope for names, allowing for resource management and access control.

### Deployments
Deployments define the desired state for application deployment, specifying the number of replicas, the container image to use, and update strategies. They enable declarative updates to applications and rollbacks if necessary.


## References
- [Kubernetes Documentation](https://kubernetes.io/docs/home/)
- [Kubernetes GitHub Repository](https://github.com/kubernetes/kubernetes)
- [Kubernetes API Reference](https://kubernetes.io/docs/reference/)  
- [Kubernetes Icon Set](https://github.com/kubernetes/community/blob/master/icons/README.md)
- [Minikube Play Ground](https://kubernetes.io/docs/tutorials/hello-minikube/)
- [K8s Labs](https://labs.play-with-k8s.com/)  
- [Killercoda Play Ground](https://killercoda.com/playgrounds/scenario/kubernetes)  
