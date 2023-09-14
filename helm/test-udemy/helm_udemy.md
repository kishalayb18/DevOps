## Helm Repository

- helm search hub
- helm repo add bitnami https://charts.bitnami.com/bitnami
- helm repo list
- helm search repo bitnami
- helm repo update
- helm repo remove bitnami
- helm search repo bitnami/mysql # to find a particular repository
- helm install testmysql bitnami/mysql
- helm uninstall testmysql

## Deploy sample configmap by creating a new Chart

- create the test-udemy folder
- create the Chart.yaml
- populate the Chart.yaml with the required fields
- create the values.yaml file
- create the templates folder
- create the configmap.yaml inside templates folder
- go one level outside of test-udemy folder
- run the command " helm install demo-configmap test-udemy/"

- helm list
- kubectl get cm
- kubectl describe cm <name of the configmap>
- helm uninstall demo-configmap

## Fetching from values.yaml

// values.yaml file will be the default source
- helm install --debug --dry-run first-dryrun test-udemy/
- helm install configmap-demo-default test-udemy/

// custom environment specific values.yaml file needs to be mention
- helm install --debug --dry-run firstdryrun test-udemy/ --values test-udemy/values-dev.yaml
- helm install configmap-sit test-udemy/ --values test-udemy/values-sit.yaml
