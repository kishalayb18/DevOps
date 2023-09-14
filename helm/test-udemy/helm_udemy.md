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

## Precedence of the Values in Helm

- First: when --set is mentioned in the command line
```
helm upgrade --set env="GREEN" configmap-sit test-udemy/ --values test-udemy/values-sit.yaml
```
>>it will choose env="GREEN" over the value mentioned in values-sit.yaml

- Second: when --values is mentioned then it'll choose the custom environment specific values-sit.yaml file over the default values.yaml file
```
helm install configmap-sit test-udemy/ --values test-udemy/values-sit.yaml
```

- Third: when nothing is mentioned values will be picked from the default values.yaml file, if values.yaml file is not present and the --values flag is not mentioned then it will throw error

>> even if we are mentioning 3 fields out of 5 in the custom values-sit.yaml file, and 2 fileds are not mentioned, then if the two fields are mentioned in values.yaml file, then those 2 fields'values will be taken from the default values.yaml file and rest 3 will be fetched from custom values-sit.yaml file

- Fourth: if both custom and default values.yaml files don't have value for a specfic parameter, and the default value is mentioned in the template yaml file (deployment.yaml etc) then the default value will be taken
```
env: {{ .Values.env | default "SANDBOX" }}
```