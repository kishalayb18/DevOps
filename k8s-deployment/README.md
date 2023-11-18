## minikube Commands
```
#for the first time
start minikube --vm-driver=virualbox 
minikube start --no-vtx-check

minikube start #to resume minikube

minikube status

minikube stop

#need not to use this command if you want to resume minikube later
minikube delete 

## Troubleshooting

 ### Linux 
# Set your proxy
export HTTP_PROXY=http://<proxy hostname:port>
export HTTPS_PROXY=https://<proxy hostname:port>

### Windows
set HTTP_PROXY=http://<proxy hostname:port>
set HTTPS_PROXY=https://<proxy hostname:port>