We will run a pod with simple http server but port numbers should come from config-map, 
Create two services out of it of type nodePort and clusterIP (use config map for ports)

Create rs for pods with replicas=2

Do it using individual yml files 
Do it as a single deployment