## minikube Commands
```
# for the first time
start minikube --vm-driver=virualbox 
minikube start --no-vtx-check

# from second time
minikube start #to resume minikube
minikube status
minikube stop

#need not to use this command if you want to resume minikube later
minikube delete 
```

### Linux 
**Set your proxy**
export HTTP_PROXY=http://<proxy hostname:port>
export HTTPS_PROXY=https://<proxy hostname:port>

### Windows
set HTTP_PROXY=http://<proxy hostname:port>
set HTTPS_PROXY=https://<proxy hostname:port>

### kubens
kubectx is a tool to switch between contexts (clusters) on kubectl faster.
kubens is a tool to switch between Kubernetes namespaces (and configure them for kubectl) easily
[Git Repository Link](https://github.com/ahmetb/kubectx)

**Windows**
```
winget install --id ahmetb.kubectx
winget install --id ahmetb.kubens
```
**Linux (Manually)**
```
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
ls /usr/local/bin
sudo chmod +x /usr/local/bin/kubectx
sudo chmod +x /usr/local/bin/kubens
ls /usr/local/bin
kubens
```
