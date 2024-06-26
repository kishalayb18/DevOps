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
The kubelet uses Liveness Probes to know when to restart a container. For example, Liveness Probes could catch a deadlock, where an application is running, but unable to make progress. Restarting a container in such a state can help to make the application more available despite bugs
The periodSeconds field specifies that the kubelet should perform a liveness probe every 3 seconds. The initialDelaySeconds field tells the kubelet that it should wait 3 seconds before performing the first probe. To perform a probe, the kubelet sends an HTTP GET request to the server that is running in the container and listening on port 8080. If the handler for the server's _/healthz_ path returns a success code, the kubelet considers the container to be alive and healthy. If the handler returns a failure code, the kubelet kills the container and restarts it.
Any code greater than or equal to _200_ and lesser than _400_ indicates success. Any other code indicates failure status<br/>

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
