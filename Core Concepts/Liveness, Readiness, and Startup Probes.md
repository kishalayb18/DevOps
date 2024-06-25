# Liveness, Readiness, and Startup Probes
A probe is a periodic check that monitors the health of the application. You can configure probes either using kubectl command line or YAML deployment template.<br/>
Three Types of probes include
- Startup Probe
- Liveness Probe
- Readiness Probe

## 1. Startup Probe
Startup Probe verifies whether the application within the container is started. Startup Probe runs before any other probe and disables other probes till it gets completed successfully.
This type of probe is only executed at the startup, unlike readiness probes, which run periodically.

Code Snippet of Startup Probe
```
startupProbe:
    httpGet:
        path: /healthz
        port: 8080
    failureThreshold: 30
    periodSeconds: 10
```
