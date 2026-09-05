# CI/CD

This folder contains continuous integration and delivery workflows using Cloud Build, GitHub pipelines, and Jenkins.

## Workflow Overview

- [CI/CD Workflow Overview](cicd%20workflow%20overview)

## Cloud Build

- [Continuous Integration](Cloudbuild/CI/)
  - [Cloud Build Configuration](Cloudbuild/CI/Cloudbuild.yaml)
  - [Dockerfile](Cloudbuild/CI/Dockerfile)
- [Continuous Delivery](Cloudbuild/CD/)
  - [Cloud Build Configuration](Cloudbuild/CD/Cloudbuild.yaml)
- [Disaster Recovery Pipeline](Cloudbuild/DR%20Pipeline/)
  - [Cloud Build Configuration](Cloudbuild/DR%20Pipeline/Cloudbuild.yaml)
  - [Pipeline Script](Cloudbuild/DR%20Pipeline/SCRIPT.SH)
- [Terraform Pipeline](Cloudbuild/Terraform/)
  - [Terraform Pipeline](Cloudbuild/Terraform/terraform.yaml)

## GitHub Pipeline

- [CI Workflows](GithubPipeline/CI/)
- [Terraform Workflows](GithubPipeline/Terraform/)

## Jenkins

- [Jenkins Notes](jenkins/jenkins.md)
- [CD Pipeline](jenkins/cd-pipeline/)
  - [Build Specification](jenkins/cd-pipeline/build-spec.yaml)
  - [Jenkinsfile](jenkins/cd-pipeline/Jenkinsfile)
- [Jenkins Configuration as Code](jenkins/JCasC/)
- [Jenkins on Kubernetes](jenkins/Jenkins%20Setup%20on%20k8s/)
- [Cluster Selection](jenkins/selectCluster/)
- [Pipeline Templates](jenkins/templates/)
- [Terraform Pipeline](jenkins/terraform-pipeline/)
- [Validation](jenkins/validation/)
