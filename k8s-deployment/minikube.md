## minikube Setup
[minikube setup with virtual machine](https://www.youtube.com/watch?v=dj-qeDNvnT4)

**for the first time**
```
minikube start --vm-driver=virtualbox 
minikube start --no-vtx-check
```
**from second time**
```
minikube start #to resume minikube
minikube status
minikube stop
```
**need not to use this command if you want to resume minikube later**
```
minikube delete 
```

### Set your proxy Linux 
**Linux**
export HTTP_PROXY=http://<proxy hostname:port>
export HTTPS_PROXY=https://<proxy hostname:port>
**Windows**
set HTTP_PROXY=http://<proxy hostname:port>
set HTTPS_PROXY=https://<proxy hostname:port>

### Choco Package Manager on Windows
Open Windows Powershell
```
Set-ExecutionPolicy Bypass -Scope Process
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

### kubens
kubectx is a tool to switch between contexts (clusters) on kubectl faster.
kubens is a tool to switch between Kubernetes namespaces (and configure them for kubectl) easily
[Git Repository Link](https://github.com/ahmetb/kubectx)

**Windows**
```
choco install kubens kubectx
```

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
