# Kubernetes Networking
Kubernetes networking is a critical aspect of managing containerized applications in a distributed environment. It ensures that containers within a Kubernetes cluster can communicate with each other, with external users, and with other services smoothly. 

Let's explore the key concepts and components of Kubernetes networking:

## Pod Networking:
 - Pods share the same network namespace and can communicate via localhost.
 - Kubernetes assigns each Pod a unique IP address for inter-node communication.
## Service Networking:
 - Services provide stable endpoints for accessing Pods.
 - ClusterIP, NodePort, and LoadBalancer are common Service types for internal and external access.
## Ingress Networking:
 - Ingress manages external access to Services based on HTTP/HTTPS rules.
 - Ingress controllers handle traffic routing to Services within the cluster.
## Network Policies:
 - This defines rules for Pod-to-Pod communication and access to external resources.
 - It enables fine-grained control over network traffic within the cluster.
## Container Network Interface (CNI):
 - A standard for defining plugins that handle networking in container runtimes.
 - Used by Kubernetes to manage network interfaces and IP addresses.
## Networking Plugins:
 - Kube-Proxy manages network rules for routing traffic to Services.
 - CoreDNS resolves DNS queries for Kubernetes Services and Pods.

