# JCasC

## Steps

1. Plugins
- Configuration as Code
- kubernetes

2. Setup config file credential

3. Setup user token

4. Setup cloud

5. Create pipeline, provide the right SCM source

6. Create the jenkins.yaml where you will keep the JCasC configs

7. Make sure the Jenkins deployment has the CASC_JENKINS_CONFIG variable

```yaml
containers:
    - name: jenkins
      image: jenkins
      env:
      - name: CASC_JENKINS_CONFIG
        value: /var/jenkins_home/casc_configs/jenkins.yaml
```

8. Create the Volume, Volume Mounts for the Configmap

volumemounts

```yaml
volumeMounts:
    - name: casc-volume
      mountPath: /var/jenkins_home/casc_config
```

volumes

```yaml
volumes:
    - name: casc-volume
      configMap:
        name: casc-configmap
```