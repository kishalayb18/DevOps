# Secops Project :  cluster governance rules using kyverno

- 1 [Problem statement](https://github.com/kishalayb18/DevOps/blob/feature/kubernetes/k8s-deployment/kyverno/kyverno.md#problem-statement)
- 2 [What is kyverno](https://github.com/kishalayb18/DevOps/blob/feature/kubernetes/k8s-deployment/kyverno/kyverno.md#what-is-kyverno)
- 3 [Workflow](https://github.com/kishalayb18/DevOps/blob/feature/kubernetes/k8s-deployment/kyverno/kyverno.md#workflow)
- 4 [Scope of this project](https://github.com/kishalayb18/DevOps/blob/feature/kubernetes/k8s-deployment/kyverno/kyverno.md#scope-of-this-project)
- 5 [Commands](https://github.com/kishalayb18/DevOps/blob/feature/kubernetes/k8s-deployment/kyverno/kyverno.md#commands)
- 6 [Tools leveraged](https://github.com/kishalayb18/DevOps/blob/feature/kubernetes/k8s-deployment/kyverno/kyverno.md#tools-leveraged)
- 7 [Reference links](https://github.com/kishalayb18/DevOps/blob/feature/kubernetes/k8s-deployment/kyverno/kyverno.md#reference-links)

### Problem statement

### What is kyverno
kyverno is dynamic kubernetes admission controller which functions at the cluster level, this can do the following operations in Kubernetes
- generate
- validate
- mutate
- verify images

### Workflow

### Scope of this project
in this project we will leverage the validate feature, to enforce the request limit policy for the pods, similarly namespace resource quota policy, certain naming convention for deployment, require probes for health check, this sort of policies can also be enforced by kyverno

We will configure certain policies to enforce the rules, then we will try violating those rules to verify how kyverno restrict the resources from provisioning

this project involves the best practices of SecOps, however not only security, with this cost optimization can be assured from business point of view when we implement the admission controller to the kubernetes cluster

### Commands
- install kyverno to the cluster 
```
kubectl create -f https://github.com/kyverno/kyverno/releases/download/v1.8.5/install.yaml
```
- validate kyverno is installed
```
kubectl get pods -n kyverno
```
- deploy the resource policy
```
 kubectl apply -f .\enforce-pod-requests-limits.yaml
```
- verify the policy got deployed properly
```
kubectl get ClusterPolicy
```
- check kyverno pods log to verify the policy is now synced with kyverno
```
- kubectl logs pod/<kyverno pod name> -n kyverno
```
- try deploying resource that would violate the policy rule
```
kubectl apply -f deployment.yaml
```
> here when we tried to deploy pods without specifying the request, limits of the cpu and memory, then the kyverno admission webhook blocks the resource to be deployed and throws an exception message which we specified in the policy file

    Error from server: error when creating ".\\deployment.yaml": admission webhook "validate.kyverno.svc-fail" denied the request:

    policy Deployment/cns/green-deployment for resource violation:

    require-requests-limits:
    autogen-validate-resources: 'validation error: CPU and memory resource requests
        and limits are required. rule autogen-validate-resources failed at path /spec/template/spec/containers/0/resources/limits/


### Tools leveraged
- kubernetes cluster : minikube
- SCM : git, github

### Reference links
- [kyverno tuitorial](https://www.youtube.com/watch?v=5ihkMblumD0)
- [kyverno documentation]( https://kyverno.io/docs/kyverno-policies/)
- [kyverno github](https://github.com/kyverno/kyverno)
