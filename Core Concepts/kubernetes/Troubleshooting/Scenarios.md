# Kubernetes Troubleshooting

## ImagePull

## CrashLoops

## PendingPods
- Insufficient  resources
- Taint Tolerance
- Affinity, Label Selector



## Missing Pods
- Falied to create replicaset due to the resource quota on the namespace
- service account not found

## Schrodingers Deployment
- when the service selectors match the labels of two different deployments, the service will serve both the deployments pods which makes the confusion




## Container errors

### Create Container Config error
- when configmaps or the secrets missing to set the environment

### Create Container error
- when the entry point is not there

### run container error
- when the command is not right
