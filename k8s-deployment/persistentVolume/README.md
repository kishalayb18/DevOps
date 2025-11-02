# Kubernetes Volumes

## Pre-requisite: To Create a Database via Mongo Compass
- Deploy the mongo pod, service
- do the port forwarding by ```kubectl port-forward svc/mongo-svc 32000:27017```
- open the mongo compass
- select _New Connection_
- go to the _Advanced Connection Options_
- click on the _Authentication Method - Username/Password_
- provide the Username/Password same as what has been provided to the deployment environment variable
- modify the URI to change the port number from _27017_ to the forwarded port number (here 32000) _mongodb://localhost:32000_
- click on the _Connect_ button to connect with the mongo pod via mongo compass
- create a sample database and collected
- insert a sample data by inserting a document
```
{
  "sample": {
    "name": "kishalay",
    "platform":"gcp",
    "job":"cloud"
  }
}
```

## 1. Container Level Ephemeral Volumes
The firstdeployment.yaml will store the data inside the container, when the container gets restarted or deleted, the data also gets deleted


- create the deployment and service ```kubectl apply -f firstdeployment.yaml -f pv-svc.yaml```
- do port forwarding   ```kubectl port-forward svc/mongo-svc 32000:27017```
- create the database via mongo following pre-requisite
- get into the pod
- terminate a process (container) without terminating the pod
```
kubectl exec -it pod podname -- sh
ps aux
kill pid_of_the_container
kill 1
```

- type _exit_ to come out of the container
- do ```kubectl get pods``` to view the pod status
- you will see the pod got restarted
- refresh the mongo compass page
- you will find the whole database got erased
- the database was created at the container level, hence restarting the container caused this


## 2. Pod Level Ephemeral Volumes
- Store the data at the pod level with emptyDir{}
- Require to add the volume section, with that required to mount the volume inside the container, mountpath is the directory inside the container where the volume gets mounted and the data gets stored
```yaml 
          volumeMounts:
            - name:  mongosecond-volume
              mountPath:  /data/db
      volumes:
        - name: mongosecond-volume
          emptyDir: {}
```
- If there are several volumes inside a pod then we can mount the same volume in each container in the same or different directories

to check where the ephemeral volumes reside
```
kubectl get pods/mongopod -o jsonpath='{.metada.uid}'
copy the pod id of the mongopod
minikube ssh
cd /var/lib/kubelet
sudo ls pods/d803f8ae-9f99-413a-8305-b31e99efe24f/volumes/kubernetes.io~empty-d/mongosecond-volume
```

### Deployment Steps
- create the deployment and service ```kubectl apply -f seconddeployment.yaml -f pv-svc.yaml```
- do port forwarding   ```kubectl port-forward svc/mongo-svc 32000:27017```
- create the database via mongo following pre-requisite
- get into the pod
- terminate a process (container) without terminating the pod

```
kubectl exec -it pod podname -- sh
ps aux
kill pid_of_the_container
kill 1
```
- type exit to come out of the container
- do ```kubectl get pods``` to view the pod status, you will see the pod got restarted
- refresh the mongo compass page
- you will find the database is still there
- the database resides at the pod level, restarting the container will not impact the database
- restart the pod by ```kubectl rollout restart deployment mongosecond```
- or try deleting the pod ```kubectl delete pod <podname>```
- now refresh the mongo compass page
- you will find that the database got erased
- the database was created at the pod level, hence restarting the pod caused this

**Please remember, as this data is being stored at the pod level, hence other pods which are there even on the same node can not access this data**

## 3. Node Level Ephemeral Volumes

- Store data at the node level with the following volume configuration
```yaml
volumes:
    - name: mongothird-volume
      hostPath:
        path: /data
```
- This will create the _/data_ directory on the node, the same data will be mounted on the _/data/db_ directory inside the container

#### To View The Created Volume
- ssh to the minikube by ```minikube ssh```
- list the directories ```sudo ls /data```
- view the content of the files ```sudo cat /data/filename```


## 4. Persistent Volumes

### accessModes:
- ReadWriteOnce: these volumes can be read-write by a single node, best for the scenario where all the pods are running in a single node
- ReadOnlyOnce: here the volumes can be read by a single node
- ReadWriteMany: this volume can be mounted and read-write by many nodes, if the pods are running in different nodes then this suits the most
- ReadOnlyMany: here the volumes can be mounted and read by many nodes
- ReadWriteOncePod : this is when you want only one pod on the whole cluster can read and write the volume

### Create the Physical Storage Path Manually
- ssh to the minikube by ```minikube ssh```
- create the directories on the minikube node ```sudo mkdir storage/data -p```
- view the created directories ```ls storage```

### Deployment Steps
- first deploy the _pv.yaml_ file
- then deploy the _staticpvc.yaml_ file
- check the status of the PV, PVC
- notice that the PV is bound by mongo-pvc
- deploy the _deployment.yaml_ file
- deploy the _pv-svc.yaml_ do the port forward ```kubectl port-forward svc/mongo-svc 32000:27017```
- create the database via mongo following pre-requisite
- try to delete the pod
- see the db still persist as the data is stored in PV 


```
{
  "tasktwo": {
    "platform": "gcp",
    "hello":"world",
    "test":"two"
  }
}
```

## Storage Class
