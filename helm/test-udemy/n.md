## Precedence of the Values in Helm

**First: when --set is mentioned in the command line**
```
helm upgrade --set env="GREEN" configmap-sit test-kishalay-helm/ --values test-kishalay-helm/values-sit.yaml
```
> it will choose env="GREEN" over the value mentioned in values-sit.yaml

**Second: when --values is mentioned then it'll choose the custom environment specific values-sit.yaml file over the default values.yaml file**

```
helm install configmap-sit test-kishalay-helm/ --values test-kishalay-helm/values-sit.yaml
```

**Third: when --values flag is not mentioned values will be picked from the default values.yaml file, if values.yaml file is not present and the --values flag is not mentioned then it will throw error**

> even if we are mentioning 3 fields out of 5 in the custom values-sit.yaml file, and 2 fileds are not mentioned, then if the two fields are mentioned in values.yaml file, then those 2 fields'values will be taken from the default values.yaml file and rest 3 will be fetched from custom values-sit.yaml file

**Fourth: if both custom and default values.yaml files don't have value for a specfic parameter, and the default value is mentioned in the template yaml file (deployment.yaml etc) then the default value will be taken**
```
env: {{ .Values.env | default "SANDBOX" }}
```