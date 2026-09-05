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
The following section is an extract from the [Standardized Glossary](https://kubernetes.io/docs/reference/glossary/?all=true) of the Kubernetes documentation

### Pods
Pods are the smallest deployable units in Kubernetes, representing a single instance of a running process. They encapsulate one or more containers, storage resources, a unique network IP, and options for how the containers should run.

### Replicasets
A ReplicaSet (aims to) maintain a set of replica Pods running at any given time. Workload objects such as Deployment make use of ReplicaSets to ensure that the configured number of Pods are running in your cluster, based on the spec of that ReplicaSet.
- replicasets are considered a low-level type
- users often opt for higher level abstraction like deployments and DeamonSets.
- ensures that a set of identically configured Pods are running at the desired replica count
- If a Pod drops off, the ReplicaSet brings a new one online as a replacement.

### Deployments
Deployments define the desired state for application deployment, specifying the number of replicas, the container image to use, and update strategies. They enable declarative updates to applications and rollbacks if necessary.
- deployments support rolling updates and rollbacks
- rollouts can be paused

### DeamonSet
Ensures a copy of a Pod is running across a set of nodes in a cluster. Used to deploy system daemons such as log collectors and monitoring agents that typically must run on every Node.
- provides method for scheduling execution of pods
- backups, reports, automated tests
- used to install or configure software on each host node.

### CronJob
Manages a Job that runs on a periodic schedule. Similar to a line in a crontab file, a CronJob object specifies a schedule using the cron format.
- use common cron syntax to schedule tasks
- cronjobs are part of batch API

### Services
An abstract way to expose an application running on a set of Pods as a network service. The set of Pods targeted by a Service is (usually) determined by a selector. If more Pods are added or removed, the set of Pods matching the selector will change. The Service makes sure that network traffic can be directed to the current set of Pods for the workload

#### Ingress
An API object that manages external access to the services in a cluster, typically HTTP. Ingress may provide load balancing, SSL termination and name-based virtual hosting.
- route traffic to and from the cluster
- provide single SSL endpoint

### Namespaces
Namespaces are a way to divide cluster resources between multiple users. They provide scope for names, allowing for resource management and access control.

### Volumes
Volumes offer persistent storage that pods can use. Unlike containers, which are ephemeral, volumes retain data even after a pod is terminated.

### Secrets
Secrets stores sensitive information, such as passwords, OAuth tokens, and ssh keys. Allows for more control over how sensitive information is used and reduces the risk of accidental exposure, including encryption at rest. A Pod references the secret as a file in a volume mount or by the kubelet pulling images for a pod. Secrets are great for confidential data and ConfigMaps for non-confidential data

## References
- [Kubernetes Documentation](https://kubernetes.io/docs/home/)
- [Kubernetes Quick Start](https://acloudguru.com/course/kubernetes-quick-start)
- [Kubernetes GitHub Repository](https://github.com/kubernetes/kubernetes)
- [Kubernetes API Reference](https://kubernetes.io/docs/reference/)
- [Kubernetes Essentials](https://acloudguru.com/course/kubernetes-essentials)
- [Kubernetes Deep Dive](https://acloudguru.com/course/kubernetes-deep-dive)
- [Kubernetes Icon Set](https://github.com/kubernetes/community/blob/master/icons/README.md)
#### Hands on Play Ground 
- [Minikube Play Ground](https://kubernetes.io/docs/tutorials/hello-minikube/)
- [K8s Labs](https://labs.play-with-k8s.com/)  
- [Killercoda Play Ground](https://killercoda.com/playgrounds/scenario/kubernetes)  
