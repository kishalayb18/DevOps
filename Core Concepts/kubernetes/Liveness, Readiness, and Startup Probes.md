# Liveness, Readiness, and Startup Probes
A probe is a periodic check that monitors the health of the application. You can configure probes either using kubectl command line or YAML deployment template.<br/>
Three Types of probes include
- Startup Probe
- Liveness Probe
- Readiness Probe

## 1. Startup Probe
The kubelet uses startup probes to know when a container application has started. If such a probe is configured, liveness and readiness probes do not start until it succeeds, making sure those probes don't interfere with the application startup. This can be used to adopt liveness checks on slow-starting containers, avoiding them getting killed by the kubelet before they are up and running

Code Snippet of Startup Probe
```
startupProbe:
    httpGet:
        path: /healthz
        port: 8080
    failureThreshold: 30
    periodSeconds: 10
```

## 2. Liveness Probe
The kubelet uses Liveness Probes to know when to restart a container. For example, Liveness Probes could catch a deadlock, where an application is running, but unable to make progress. Restarting a container in such a state can help to make the application more available despite bugs<br/>
The periodSeconds field specifies that the kubelet should perform a liveness probe every 3 seconds. The initialDelaySeconds field tells the kubelet that it should wait 3 seconds before performing the first probe. To perform a probe, the kubelet sends an HTTP GET request to the server that is running in the container and listening on port 8080. If the handler for the server's _/healthz_ path returns a success code, the kubelet considers the container to be alive and healthy. If the handler returns a failure code, the kubelet kills the container and restarts it.
> Any code greater than or equal to _200_ and lesser than _400_ indicates success. Any other code indicates failure status<br/><br/>

Code Snippet of Liveness Probe
```
livenessProbe:
    httpGet:
        path: /healthz
        port: 8080
    initialDelaySeconds: 15
    periodSeconds: 20
```



## 3. Readiness Probe
The kubelet uses readiness probes to know when a container is ready to start accepting traffic. A Pod is considered ready when all of its containers are ready. One use of this signal is to control which Pods are used as backends for Services. When a Pod is not ready, the endpoint of the Pod is removed from Service load balancers<br/>
Readiness probes runs on the container during its whole lifecycle
> The readiness and liveness probes do not depend on each other to succeed. If you want to wait before executing a readiness probe, you should use initialDelaySeconds or a startupProbe

Code Snippet of Readiness Probe
```
readinessProbe:
    httpGet:
        path: /ready
        port: 8080
    initialDelaySeconds: 5
    periodSeconds: 10
```

## Configure Probes
Probes have a number of fields that you can use to more precisely control the behavior of startup, liveness and readiness checks:

- **initialDelaySeconds** : Number of seconds after the container has started before startup, liveness or readiness probes are initiated. If a startup probe is defined, liveness and readiness probe delays do not begin until the startup probe has succeeded. If the value of periodSeconds is greater than initialDelaySeconds then the initialDelaySeconds would be ignored. Defaults to 0 seconds. Minimum value is 0.
- **periodSeconds** : How often (in seconds) to perform the probe. Default to 10 seconds. The minimum value is 1.
- **timeoutSeconds** : Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1.
- **successThreshold** : Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup Probes. Minimum value is 1.
- **failureThreshold** : After a probe fails failureThreshold times in a row, Kubernetes considers that the overall check has failed: the container is not ready/healthy/live. For the case of a startup or liveness probe, if at least failureThreshold probes have failed, Kubernetes treats the container as unhealthy and triggers a restart for that specific container. The kubelet honors the setting of terminationGracePeriodSeconds for that container. For a failed readiness probe, the kubelet continues running the container that failed checks, and also continues to run more probes; because the check failed, the kubelet sets the Ready condition on the Pod to false.
- **terminationGracePeriodSeconds** : configure a grace period for the kubelet to wait between triggering a shut down of the failed container, and then forcing the container runtime to stop that container. The default is to inherit the Pod-level value for terminationGracePeriodSeconds (30 seconds if not specified), and the minimum value is 1
