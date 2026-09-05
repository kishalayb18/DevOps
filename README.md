# DevOps

This repository is a collection of DevOps notes, working examples, deployment manifests, CI/CD pipelines, and automation scripts. Use the map below to jump directly to the area or file you need.

## Overview

| Folders | Topics covered |
| --- | --- |
| [Core Concepts](Core%20Concepts/) | Cloud, networking, Kubernetes, CI/CD, and cloud migration |
| [CI/CD](CICD/) | Cloud Build, GitHub Actions, Jenkins, and pipeline infrastructure |
| [Kubernetes](k8s-deployment/) | Workloads, networking, storage, security, service discovery, and troubleshooting |
| [Helm](helm/) | Chart structure, commands, reusable helpers, and deployment examples |
| [Docker](docker/) | Docker fundamentals, commands, Dockerfiles, and containerized applications |
| [Terraform](terraform/) | Infrastructure as code, Terraform commands, and Kubernetes infrastructure |
| [Projects](projects/) | Python Flask application and Kubernetes deployment manifests |
| [Shell Scripts](shell-scripts/) | Shell concepts, documentation, and command-line scripts |

## Table

<details>
<summary>Core Concepts</summary>

<details>
<summary>Documentation</summary>

- [README](Core%20Concepts/README.md)
- [Microservices Architecture Components](Core%20Concepts/cloud/Microservices%20Architecture%20Components.md)
- [Strategy File](Core%20Concepts/cloud/strategy%20file%20)

</details>

<details>
<summary>Cloud</summary>

- [Cloud Migration](Core%20Concepts/cloud/Cloud%20Migration/)

</details>

<details>
<summary>Kubernetes</summary>

- [Blue-Green Deployment Strategy](Core%20Concepts/kubernetes/Blue%20Green%20Deployment%20Strategy.md)
- [Private Cluster Traffic Flow](Core%20Concepts/kubernetes/GKE%20Private%20Cluster%20Traffic%20Flow.md)
- [Ingress Overview](Core%20Concepts/kubernetes/Ingress%20Overview.md)
- [Kubernetes Deployment Strategies](Core%20Concepts/kubernetes/Kubernetes%20Deployment%20Strategies.md)
- [Network Policy](Core%20Concepts/kubernetes/Kubernetes%20Network%20Policy.md)
- [Kubernetes Networking](Core%20Concepts/kubernetes/Kubernetes%20Networking.md)
- [Kubernetes Scaling Strategies](Core%20Concepts/kubernetes/Kubernetes%20Scaling%20Strategies.md)
- [Liveness, Readiness, and Startup Probes](Core%20Concepts/kubernetes/Liveness,%20Readiness,%20and%20Startup%20Probes.md)
- [Security](Core%20Concepts/kubernetes/Security.md)
- [Service Mesh](Core%20Concepts/kubernetes/Servicemesh.md)
- [Troubleshooting](Core%20Concepts/kubernetes/Troubleshooting/)

</details>

<details>
<summary>Networking</summary>

- [AWS Network Architecture](Core%20Concepts/networking/AWS%20Network%20Architecture.md)
- [DNS Records](Core%20Concepts/networking/DNS%20Record.md)
- [GCP Networking](Core%20Concepts/networking/GCP/)
- [Load Balancers](Core%20Concepts/networking/Load%20Balancers.md)
- [Load Balancing Algorithms](Core%20Concepts/networking/Load%20Balancing%20algorithms.md)
- [Mutual TLS](Core%20Concepts/networking/mutualTLS.md)
- [Ports and Protocols](Core%20Concepts/networking/Ports%20and%20Protocols.md)
- [TLS vs SSL](Core%20Concepts/networking/TLS%20vs%20SSL.md)
- [Zero Trust Model](Core%20Concepts/networking/ZeroTrustModel/)

</details>

</details>

<details>
<summary>CI/CD</summary>

<details>
<summary>Workflow Overview</summary>

- [CI/CD Workflow Overview](CICD/cicd%20workflow%20overview)

</details>

<details>
<summary>Cloud Build</summary>

- [Cloud Build Configuration](CICD/Cloudbuild/CI/Cloudbuild.yaml)
- [Dockerfile](CICD/Cloudbuild/CI/Dockerfile)
- [Continuous Integration](CICD/Cloudbuild/CI/)
- [Cloud Build Configuration](CICD/Cloudbuild/CD/Cloudbuild.yaml)
- [Continuous Delivery](CICD/Cloudbuild/CD/)
- [Cloud Build Configuration](CICD/Cloudbuild/DR%20Pipeline/Cloudbuild.yaml)
- [Pipeline Script](CICD/Cloudbuild/DR%20Pipeline/SCRIPT.SH)
- [Disaster Recovery Pipeline](CICD/Cloudbuild/DR%20Pipeline/)
- [Terraform Pipeline](CICD/Cloudbuild/Terraform/terraform.yaml)
- [Terraform Pipeline Folder](CICD/Cloudbuild/Terraform/)

</details>

<details>
<summary>GitHub Pipeline</summary>

- [CI Workflows](CICD/GithubPipeline/CI/)
- [Terraform Workflows](CICD/GithubPipeline/Terraform/)

</details>

<details>
<summary>Jenkins</summary>

- [Jenkins Notes](CICD/jenkins/jenkins.md)
- [Build Specification](CICD/jenkins/cd-pipeline/build-spec.yaml)
- [Jenkinsfile](CICD/jenkins/cd-pipeline/Jenkinsfile)
- [CD Pipeline](CICD/jenkins/cd-pipeline/)
- [Jenkins Configuration as Code](CICD/jenkins/JCasC/)
- [Jenkins on Kubernetes](CICD/jenkins/Jenkins%20Setup%20on%20k8s/)
- [Cluster Selection](CICD/jenkins/selectCluster/)
- [Pipeline Templates](CICD/jenkins/templates/)
- [Terraform Pipeline](CICD/jenkins/terraform-pipeline/)
- [Validation](CICD/jenkins/validation/)

</details>

</details>

<details>
<summary>Kubernetes Deployments</summary>

The [Kubernetes deployment area](k8s-deployment/) contains examples for workload scheduling, networking, storage, security, service discovery, and troubleshooting.

- [Kubernetes Overview](k8s-deployment/overview.md)
- [Minikube Guide](k8s-deployment/minikube.md)

<details>
<summary>Argo</summary>

- [Deployment](k8s-deployment/argo/deployment.yaml)
- [Sample](k8s-deployment/argo/sample.yaml)
- [Secret](k8s-deployment/argo/secret.yaml)

</details>

<details>
<summary>ConfigMaps</summary>

- [ConfigMap](k8s-deployment/configmaps/configmap.yaml)
- [Deployment with ConfigMap](k8s-deployment/configmaps/deployment-cm.yaml)
- [Deployment with copied environment file](k8s-deployment/configmaps/deployment-env%20copy.yaml)
- [Deployment with environment file](k8s-deployment/configmaps/deployment-env.yaml)
- [README](k8s-deployment/configmaps/README.md)

</details>

<details>
<summary>DNS Example</summary>

- [Namespace](k8s-deployment/dns-example/namespace.yaml)
- [Pod 1](k8s-deployment/dns-example/pod1.yaml)
- [Pod 2](k8s-deployment/dns-example/pod2.yaml)
- [Service](k8s-deployment/dns-example/service.yaml)
- [README](k8s-deployment/dns-example/README.md)

</details>

<details>
<summary>Ingress</summary>

- [Deployment](k8s-deployment/ingress/deployment.yaml)
- [Ingress](k8s-deployment/ingress/ingress.yaml)
- [Second ingress](k8s-deployment/ingress/ingress2.yaml)
- [Service](k8s-deployment/ingress/service.yaml)
- [macOS guide](k8s-deployment/ingress/MacGuide.md)
- [Windows guide](k8s-deployment/ingress/WindowsGuide.md)

</details>

<details>
<summary>Init Container</summary>

- [Deployment](k8s-deployment/init-container/deployment.yaml)
- [Namespace](k8s-deployment/init-container/namespace.yaml)
- [Sample](k8s-deployment/init-container/sample.yaml)
- [README](k8s-deployment/init-container/README.md)

</details>

<details>
<summary>Kyverno</summary>

- [Deployment](k8s-deployment/kyverno/deployment.yaml)
- [Enforce pod requests and limits](k8s-deployment/kyverno/enforce-pod-requests-limits.yaml)
- [Kyverno notes](k8s-deployment/kyverno/kyverno.md)

</details>

<details>
<summary>Minikube Jenkins</summary>

- [Minikube Jenkins manifest](k8s-deployment/minikube-jenkins/minikube-jenkins.yaml)

</details>

<details>
<summary>Network Policy</summary>

- [Backend policy](k8s-deployment/network%20policy/be-network-policy.yaml)
- [Database policy](k8s-deployment/network%20policy/db-network-policy.yaml)
- [Deny policy](k8s-deployment/network%20policy/deny-network-policy.yaml)
- [Deployment](k8s-deployment/network%20policy/deployment.yaml)
- [Deployment notes](k8s-deployment/network%20policy/deployment.md)
- [Frontend policy](k8s-deployment/network%20policy/fe-network-policy.yaml)
- [Namespace](k8s-deployment/network%20policy/namespace.yaml)
- [Service](k8s-deployment/network%20policy/service.yaml)
- [README](k8s-deployment/network%20policy/README.md)

</details>

<details>
<summary>Node and Pod Affinity</summary>

- [Pod with node affinity](k8s-deployment/nodeaffinity/pod-nodeaffinity.yaml)
- [Pod with pod affinity](k8s-deployment/nodeaffinity/pod-podaffinity.yaml)
- [README](k8s-deployment/nodeaffinity/README.md)

</details>

<details>
<summary>Persistent Volumes</summary>

- [Deployment](k8s-deployment/persistentVolume/deployment.yaml)
- [Dynamic PVC](k8s-deployment/persistentVolume/dynaminpvc.yaml)
- [First deployment](k8s-deployment/persistentVolume/firstdeployment.yaml)
- [PV service](k8s-deployment/persistentVolume/pv-svc.yaml)
- [Persistent volume](k8s-deployment/persistentVolume/pv.yaml)
- [Second deployment](k8s-deployment/persistentVolume/seconddeployment.yaml)
- [Static PVC](k8s-deployment/persistentVolume/staticpvc.yaml)
- [Storage class](k8s-deployment/persistentVolume/storageclass.yaml)
- [Third deployment](k8s-deployment/persistentVolume/thirddeployment.yaml)
- [README](k8s-deployment/persistentVolume/README.md)

</details>

<details>
<summary>Pod and Service Examples</summary>

- [Pod Name Example](k8s-deployment/podname/)
- [Pod Sample](k8s-deployment/podsample/)
- [Service Example](k8s-deployment/service-example/)
- [Service Across Namespaces](k8s-deployment/service%20for%20multiple%20ns/)

</details>

<details>
<summary>Practice Cloud</summary>

- [Task 1](k8s-deployment/practiceCloud/task1/)
- [Task 2](k8s-deployment/practiceCloud/task2/)
- [Task 3 Application](k8s-deployment/practiceCloud/task3/application/)

</details>

<details>
<summary>Priority Class and QoS</summary>

<details>
<summary>Priority Class</summary>

- [Priority Class Folder](k8s-deployment/priority-class/)
- [Priority Class](k8s-deployment/priority-class/priority-class.yaml)
- [Pods](k8s-deployment/priority-class/pods.yaml)
- [Pod Disruption Budget](k8s-deployment/priority-class/pdb.yaml)
- [Priority Class README](k8s-deployment/priority-class/README.md)

</details>

<details>
<summary>QoS</summary>

- [QoS Folder](k8s-deployment/QoS/)
- [QoS Pods](k8s-deployment/QoS/pods.yaml)
- [QoS README](k8s-deployment/QoS/README.md)

</details>

</details>

<details>
<summary>RBAC</summary>

- [Editor role](k8s-deployment/RBAC/editor-role.yaml)
- [Editor role binding](k8s-deployment/RBAC/editor-role-bindinding.yaml)
- [Editor service account](k8s-deployment/RBAC/editor-sa.yaml)
- [Viewer role](k8s-deployment/RBAC/viewer-role.yaml)
- [Viewer role binding](k8s-deployment/RBAC/viewer-role-binding.yaml)
- [Viewer service account](k8s-deployment/RBAC/viewer-sa.yaml)
- [README](k8s-deployment/RBAC/README.md)

</details>

<details>
<summary>Service Mesh Bookinfo</summary>

- [Networking Resources](k8s-deployment/servicemesh%20bookinfo/networking/)
- [Service Mesh Diagrams](k8s-deployment/servicemesh%20bookinfo/servicemeshdiagrams/)
- [Workloads](k8s-deployment/servicemesh%20bookinfo/workloads/)
- [Deployment](k8s-deployment/servicemesh%20bookinfo/deploy.yaml)
- [Ingress](k8s-deployment/servicemesh%20bookinfo/ingress.yaml)
- [Steps](k8s-deployment/servicemesh%20bookinfo/STEPS.md)
- [README](k8s-deployment/servicemesh%20bookinfo/README.MD)

</details>

<details>
<summary>Workload Patterns</summary>

- [Single-Container Application](k8s-deployment/single-container-application/)
- [Sidecar Container](k8s-deployment/sidecar-container/)
- [Taskmaster Flask Application](k8s-deployment/taskmaster-py-flask/)
- [Wishlist Database](k8s-deployment/wishlist-db/)
- [Vault](k8s-deployment/vault/)
- [Troubleshooting](k8s-deployment/troubleshooting/)

</details>

</details>

<details>
<summary>Helm</summary>

<details>
<summary>Documentation</summary>

- [General Helm Guide](helm/general_helm_guide.md)
- [Helm Commands](helm/helm_commands.md)
- [Helm README](helm/REDME.md)

</details>

<details>
<summary>Charts and Examples</summary>

- [Common Chart Helpers](helm/common/)
- [Coupon Service Chart](helm/coupnservice/)
- [Multiple ConfigMap Deployment](helm/multiple-cm-deployment/)
- [Sample Chart Structure](helm/sampleStructure/)
- [Test Chart](helm/test-udemy/)

</details>

</details>

<details>
<summary>Docker</summary>

<details>
<summary>Documentation</summary>

- [Docker README](docker/README.md)
- [Docker Commands](docker/docker_notes/commands.md)
- [Docker Lifecycle](docker/docker_notes/docker_lifecycle.md)
- [Docker Notes](docker/docker_notes/)

</details>

<details>
<summary>Examples and Templates</summary>

- [Dockerfile Templates](docker/dockerfiles_templates/)
- [HelloKishalay Java Example](docker/hellokishalay/)
- [Spring Boot Container Example](docker/SpringBootDemo/)
- [Multistage Build Examples](docker/multistage/)
- [HTML Container Example](docker/htmlFile/)

</details>

</details>

<details>
<summary>Terraform</summary>

<details>
<summary>Documentation</summary>

- [Terraform Guide](terraform/README.md)
- [Terraform Commands](terraform/terraform%20commands.md)

</details>

<details>
<summary>Examples</summary>

- [Kubernetes Load Balancer Service](terraform/kubernetesLBServie/)

</details>

</details>

<details>
<summary>Projects</summary>

<details>
<summary>Python Flask Microservice</summary>

- [Project README](projects/py-flask/README.md)
- [Application](projects/py-flask/application/)
- [Deployment Manifests](projects/py-flask/deployment-manifests/)

</details>

</details>

<details>
<summary>Shell Scripts</summary>

<details>
<summary>Documentation</summary>

- [Shell Scripting Notes](shell-scripts/README.md)

</details>

<details>
<summary>Scripts</summary>

- [sed scripts](shell-scripts/sed-scripts/)

</details>

</details>

## Contribution Guide

To contribute, follow the [contribution guide](CONTRIBUTING.md) or contact [Kishalay Bhattacharya](https://www.linkedin.com/in/connect-with-kishalay-bhattacharya/).

## Maintainers & Contributors
<table>
  <tr>
    <td align="center">
      <a href="https://github.com/kishalayb18">
        <img src="https://avatars.githubusercontent.com/u/64585126?s=400&u=4f54035173c78d29fb38c3083be64e2f80a66afa&v=4" width="100px;" alt="Kishalay Bhattacharya"/><br />
        <sub>
          <b>Kishalay Bhattacharya</b>
        </sub>
      </a><br />
        <sub>
          Role: Repository Owner, Project Maintainer
        </sub><br />        
    </td>
  </tr>
</table>  
