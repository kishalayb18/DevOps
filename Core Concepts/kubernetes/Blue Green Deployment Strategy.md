# Blue-Green Deployment Strategy

Blue-Green deployment Strategy is for releasing applications with zero downtime and easy rollback, this deployment strategy becomes crucial for critical customer-facing applications.

This guide will walk you through implementing Blue-Green deployments in a Kubernetes

## Implementation Steps

### 1. Prepare Kubernetes Manifests
Since it is a blue-green deployment, we will need two manifests one for the green version and one for the blue version.

Create separate deployments for blue and green versions

blue-deployment.yaml
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-blue
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
      version: blue
  template:
    metadata:
      labels:
        app: myapp
        version: blue
    spec:
      containers:
      - name: myapp
        image: myapp:1.0
        ports:
        - containerPort: 8080
```

green-deployment.yaml
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-green
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
      version: green
  template:
    metadata:
      labels:
        app: myapp
        version: green
    spec:
      containers:
      - name: myapp
        image: myapp:1.1
        ports:
        - containerPort: 8080
```

### 2. Set Up Service and Ingress
Create a service that can be switched between blue and green versions
What ingress does is it maps the service to the load balancer, exposing the service externally. The load balancer then distributes traffic between the two deployments.

service.yaml
```yaml
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  selector:
    app: myapp
    # Note: We don't specify the version (blue/green) here.
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
```

ingress.yaml
```yaml

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: myapp-ingress
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/canary: "true"
    nginx.ingress.kubernetes.io/canary-weight: "0"
spec:
  rules:
    - host: myapp.example.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: myapp-service
                port: 
                  number: 80

```

### 3. Implement Deployment Script

1. Deploy new (green) version
```
kubectl apply -f green-deployment.yaml
```

2. Wait for green deployment to be ready
```
kubectl rollout status deployment/myapp-green
```

3. Run smoke tests on green deployment

4. Switch the traffic to green
```
kubectl patch service myapp-service -p '{"spec":{"selector":{"version":"green"}}}'
```

5. If everything is fine, delete the old (blue) deployment
```
kubectl delete -f blue-deployment.yaml
```

6. If not, you can quickly rollback by switching the service back to blue
```
kubectl patch service myapp-service -p '{"spec":{"selector":{"version":"blue"}}}'
```

## Database Migrations with BG
Database migrations in a blue-green deployment scenario are challenging because you need to maintain compatibility between the two versions of your application (blue and green) and the database schema. What we want is to perform these migrations without downtime and ensure both versions can operate correctly during the transition. which is simple
You can use any of your strategies. For database changes, you can use a migration tool that supports reversible migrations. Run migrations before deploying the green version
