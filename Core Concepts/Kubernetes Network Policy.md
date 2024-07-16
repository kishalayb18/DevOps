# Kubernetes Network Policy
Network Policies in Kubernetes allow you to control the flow of traffic between pods within a cluster. They are used to define rules that specify which connections are allowed or denied between groups of pods and other network endpoints. This is crucial for securing your microservices by preventing unauthorized access and limiting potential attacks.

BASIC CONCEPTS OF K8S: 
1. Pod Selector: This is used to select the group of pods the policy applies to. It works based on labels assigned to the pods.
2. Ingress Rule: These define the allowed incoming connections to the selected pods.
3. Egress Rules: These define the allowed outgoing connections from the selected pods.
4. Namespaces: Policies are typically applied within a specific namespace, helping to organize and manage resources efficiently.

## Sample Network Policy Workflow Diagram
![Kubernetes Deployment Strategies](https://github.com/kishalayb18/DevOps/blob/kishalayb18-patch-1/Core%20Concepts/png/networkpolicy.jfif)

#### 1. Allow frontend to backend traffic
This policy allows traffic from pods labeled `app: frontend` to reach pods labeled `app: backend`.

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
 name: frontend-to-backend
 namespace: e-commerce
spec:
 podSelector:
 matchLabels:
 app: backend
 ingress:
 - from:
 - podSelector:
 matchLabels:
 app: frontend
```

#### 2. Allow backend to database traffic
This policy permits traffic from pods labeled `app: backend` to access pods labeled `app: database`.

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
 name: backend-to-database
 namespace: e-commerce
spec:
 podSelector:
 matchLabels:
 app: database
 ingress:
 - from:
 - podSelector:
 matchLabels:
 app: backend
```

#### 3. Restrict database access
This Policy denies all ingress (incoming) traffic to pods labeled as app: database. Empty ingress list specifies, no pods are allowed to connect to the database pods.

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
 name: deny-db-from-frontend
 namespace: e-commerce
spec:
 podSelector:
 matchLabels:
 app: database
 ingress: []
```

## Best Practices
1. Principle of Least Privilege: Only allow the minimum necessary access between pods. This reduces the risk of unauthorized access.
2. Use Namespaces: Organize your resources and apply network policies within specific namespaces for better management and security.
3. Monitor and Audit: Regularly review and update your network policies to ensure they align with your current security requirements.
