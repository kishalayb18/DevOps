@echo off
kubectl get pods -n vault
echo Waiting for 10 seconds...
timeout /t 10 /nobreak
kubectl get pods -n vault