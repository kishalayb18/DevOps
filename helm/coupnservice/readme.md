helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo list
helm create couponservice
helm dependency update
helm install couponservice-firstrelease .
helm upgrade couponservice-firstrelease .
