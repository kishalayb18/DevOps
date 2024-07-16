# Kubernetes Troubleshooting Guide

## Debugging Kubernetes Pod Failure
Pods can have _startup_ and _runtime_ errors

#### Startup Errors Includes
_ImagePullBackoff_, _ImageInspectError_, _ErrImagePull_, _ErrImageNeverPull_, _RegistryUnavailable_, _InvalidImageName_

#### Runtime Error Includes
_CrashLoopBackOff_, _RunContainerError_, _KillContainerError_, _VerifyNonRootError_, _RunInitContainerError_, _CreatePodSandboxError_, _ConfigPodSandboxError_, _KillPodSandboxError_, _SetupNetworkError_, _TeardownNetworkError_

#### 1. CrashLoopBackOff :
**Description**: A pod repeatedly crashes and restarts.
Usually, a container can't start when:
- There's an error in the application that prevents it from starting.
- You misconfigured the container.
- The Liveness probe failed too many times<br/>
**Troubleshooting** :
- Check pod logs: `kubectl logs <pod-name>`.
- Describe the pod for more details: `kubectl describe pod <pod-name>`.
- Investigate the application's start-up and initialization code.

#### 2. ImagePullBackOff :
**Description**: This error appears when hashtag#k8s isn't able to retrieve the image for one of the containers of the Pod
**Troubleshooting** :
- Verify the image name and tag.
- The image that you're trying to retrieve belongs to a private registry and the cluster doesn't have credentials to access it
- Ensure the image exists in the specified registry path.

#### 3. Pending Pods :
**Description** : Pods remain in the "Pending" state and are not scheduled. <br/>
**Troubleshooting** :
- Check node resources (CPU, memory) to ensure there is enough capacity.
- The current Namespace has a ResourceQuota object and creating the Pod will make the Namespace go over the quota
- Ensure the nodes are labeled correctly if using node selectors or affinities.
- The Pod is bound to a Pending PersistentVolumeClaim
- Verify there are no taints on nodes that would prevent scheduling.

#### 4. RunContainerError
**Description** : The error appears when the container is unable to start before the application<br/>
**Troubleshooting** :
- Mounting a not-existent volume such as ConfigMap or Secrets
- Mounting a read-only volume as read-write
- More detailed aspects can be found by describing the 'failed' pod

#### 5. Node Not Ready:
**Description** : One or more nodes are in a "NotReady" state.<br/>
**Troubleshooting** :
- Check node status: `kubectl describe node <node-name>`.
- Review kubelet logs on the affected node.
- Ensure the node has network connectivity.

#### 6. Service Not Working
**Description** : Services are not accessible or routing traffic correctly.<br/>
**Troubleshooting** :
- Check the service and endpoints: `kubectl get svc` and `kubectl get endpoints`.
- Verify network policies and firewall rules.
- Ensure the pods backing the service are healthy and running.

#### 7. Insufficient Resources:
**Description** : Pods cannot be scheduled due to insufficient resources.<br/>
**Troubleshooting** :
- Review resource requests and limits in pod specifications.
- Scale the cluster by adding more nodes.

#### 8. PersistentVolume Claims Pending :
**Description** : PVCs remain in a "Pending" state.<br/>
**Troubleshooting** :
- Check if there are available PVs that match the PVC specifications.
- Ensure the storage class exists and is configured correctly.
- Verify that the underlying storage backend is healthy.

#### 9. Pod Stuck Terminating :
**Description** : Pods get stuck in a "Terminating" state.<br/>
**Troubleshooting** :
- Check for finalizers that might be preventing pod deletion.
- Review the logs for shutdown hooks or long-running processes.
- Force delete the pod if necessary: `kubectl delete pod <pod-name> --force --grace-period=0`.

#### 10. DNS Resolution Issues :
**Description** : DNS lookups within the cluster fail.
**Troubleshooting**:
- Check the DNS pod logs (e.g., CoreDNS): `kubectl logs <coredns-pod>`.
- Ensure the DNS service is running: `kubectl get svc -n kube-system`.
- Verify network policies and firewall rules do not block DNS traffic
