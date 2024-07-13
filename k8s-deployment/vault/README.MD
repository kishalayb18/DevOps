

Vault Setup

helm repo add hashicorp https://helm.releases.hashicorp.com
helm repo update
helm install vault hashicorp/vault --set "server.dev.enabled=true"
kubectl get pods
https://developer.hashicorp.com/vault/docs

Initialize Vault:
kubectl exec -it vault-0  -n vault -- vault operator init

Unseal Vault
kubectl exec -it vault-0 -- vault operator unseal <Unseal Key 1>
kubectl exec -it vault-0 -- vault operator unseal <Unseal Key 2>
kubectl exec -it vault-0 -- vault operator unseal <Unseal Key 3>


Log into Vault
kubectl exec -it vault-0 -- vault login <Root Token>


Store Database Credentials in Vault
kubectl exec -it vault-0 -- vault kv put secret/mysql username="dbuser" password="dbpass"


Deploy MySQL
kubectl apply -f mysql-secret.yaml
kubectl apply -f mysql-deployment.yaml
kubectl apply -f mysql-service.yaml


vault job
Fetch MySQL Credentials from Vault in Application
kubectl apply -f vault-job.yaml


