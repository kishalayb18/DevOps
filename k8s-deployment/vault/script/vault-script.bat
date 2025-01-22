@echo off
REM Create the vault namespace
kubectl create ns vault

REM Add the HashiCorp Helm repository
helm repo add hashicorp https://helm.releases.hashicorp.com -n vault

REM Update the Helm repository
helm repo update -n vault

REM Install Vault with development mode enabled
helm install vault hashicorp/vault --set "server.dev.enabled=true" -n vault

REM Get the list of pods
kubectl get pods -n vault
echo Waiting for 10 seconds...
timeout /t 25 /nobreak
kubectl get pods -n vault