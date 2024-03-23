# Persistent Volumes

## 1. To Create Database via Mongo Compass
- Deploy the mongo pod, service
- do the port forwarding by ```kubectl port-forward svc/mongo-svc 32000:27017```
- open the mongo compass
- select _New Connection_
- go to the _Advanced Connection Options_
- click on the _Authentication Method - Username/Password_
- provide the Username/Password same what has been provided to the deployment environment variable
- modify the uri to change the port number from _27017_ to the forwarded port number (here 32000) _mongodb://localhost:32000_
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

## 2. Container Level Ephimeral Volumes
> the firstdeployment.yaml will store the data inside the container, when the container gets restarted or deleted, the data also gets deleted

##### to terminate a process (container) without terminating the pod

```
kubectl exec -it pod podname -- sh
ps aux
kill pid_of_the_container
kill 1
```

- type exit to come out of the container
- do ```kubectl get pods``` to view the pod status
- you will see the pod got restarted
- refresh the mongo compass page
- you will find the whole database got earesed
- the database got created at the container level, hence restarting the container caused this


## 3. Pod Level Ephimeral Volumes
> store the data at the pod level, emptyDir
> require to add the volume section with that require to mount the volume inside the container, mountpath is the directory inside the container where the volume gets mounted and the data gets stored
> if there are several volumes inside a pod then we can mount the same volume in each container in the same or different directories

to check where the ephimeral volumes resides
```
kubectl get pods/mongopod -o jsonpath='{.metada.uid}'
copy the pod id of the mongopod
minikube ssh
cd /var/lib/kubelet
sudo ls pods/d803f8ae-9f99-413a-8305-b31e99efe24f/volumes/kubernetes.io~empty-d/mongosecond-volume
```

## 4. Node Level Ephimeral Volumes
Store data at the node level with the following volume configuration
```
volumes:
    - name: mongothird-volume
      hostPath:
        path: /data
```
This will create the _/data_ directory on the node, the same data will be mounted on the _/data/db_ directory inside the container

##### To View The Created Volume
- ssh to the minikube by ```minikube ssh```
- list the directories ```sudo ls /data```
- view the content of the files ```sudo cat /data/filename```


```
kubectl port-forward svc/mongo-svc 32000:27017
```


- type exit to come out of the container
- do ```kubectl get pods``` to view the pod status,
you will see the pod got restarted
- refresh the mongo compass page
- you will find the database is still there
- the database resides at the pod level, hence restart of the container will not impact the database
- restart the pod by ```kubectl rollout restart deployment deploymentname```
- or try deleting the pod ```kubectl delete pod podname```
- now refresh the mongo compass page
- you will find that the database got earesed
- the database got created at the pod level, hence restarting the pod caused this

> please remember, as this data is being stored at the pod level, hence other pods which are there even on the same node can not access these data


/** 
* Paste one or more documents here
*/
{
  "tasktwo": {
    "platform": "gcp",
    "hello":"world",
    "test":"two"
  }
}