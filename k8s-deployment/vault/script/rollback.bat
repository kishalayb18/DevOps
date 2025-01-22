@echo off
REM Uninstall Vault
echo Uninstalling Vault...
helm uninstall vault -n vault

REM Remove the HashiCorp Helm repository
echo Removing the HashiCorp Helm repository...
helm repo remove hashicorp -n vault

REM Get the list of remaining pods to confirm cleanup
echo Retrieving the list of remaining pods...
kubectl get pods -n vault
echo Waiting for 25 seconds...
timeout /t 25 /nobreak
kubectl get pods -n vault

REM delete vault namespace
echo delete the vault namespace...
kubectl delete ns vault
echo list namespaces
timeout /t 5 
kubectl get ns