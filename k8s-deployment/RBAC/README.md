# Kubernetes RBAC (Role-Based Access Control)

Role-Based Access Control (RBAC) in Kubernetes allows you to dynamically configure policies to enforce who can access specific resources and what operations they can perform. This documentation covers the basics of RBAC, including roles, role bindings, and how to apply RBAC to service accounts, users, and Active Directory (AD) groups. It also highlights best practices for managing RBAC in a Kubernetes cluster

### Roles and ClusterRoles

- Role: Defines permissions within a specific namespace.
- ClusterRole: Defines permissions cluster-wide

### RoleBindings and ClusterRoleBindings

- RoleBinding: Grants permissions defined in a Role to a user, group, or service account within a specific namespace.
- ClusterRoleBinding: Grants permissions defined in a ClusterRole to a user, group, or service account cluster-wide

### Subjects

Subjects are the entities that can perform actions on the resources, including:
- Users: Typically external identities managed by an identity provider.

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: viewer-binding
  namespace: default
subjects:
- kind: User
  name: kishalay
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: viewer
  apiGroup: rbac.authorization.k8s.io

```
- Groups: A collection of users, often defined in an identity provider like Active Directory.

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: cluster-admin-binding
subjects:
- kind: Group
  name: dev-team
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io

```
- ServiceAccounts: Identities within the Kubernetes cluster
```sh
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: viewer-sa-binding
  namespace: default
subjects:
- kind: ServiceAccount
  name: viewer-sa
  namespace: default
roleRef:
  kind: Role
  name: viewer
  apiGroup: rbac.authorization.k8s.io
 
```

### apiGroups
In Kubernetes, `apiGroups` are used to specify which API groups the RBAC rules apply to. API groups help organize the various API resources available in Kubernetes into logical groups. Each API group can contain multiple resource types, and different API groups are often versioned independently

#### 1. Core API Group:
- The core (or legacy) API group has an empty string "" as its name.
- It includes essential resources like pods, services, nodes, namespaces, etc.

```sh
apiGroups: [""]
resources: ["pods", "services"]
verbs: ["get", "list", "watch"]
```

#### 2. Named API Groups:

These API groups have specific names and include additional and extended resources beyond the core group
- `apps`: Resources for managing applications, such as deployments, statefulsets, and daemonsets.
- `extensions`: Deprecated but previously included deployments, replicasets, etc.
- `batch`: Resources for batch processing, such as jobs and cronjobs.
- `autoscaling`: Resources for autoscaling, such as horizontalpodautoscalers.
- `networking.k8s.io`: Resources related to networking, such as networkpolicies, ingresses

### Verbs:

Verbs define the specific operations allowed by a Role or ClusterRole on particular resources
The `viewer` role might only need to read resources, so it uses verbs like _get_, _list_, and _watch_
The `editor` role might need full control over resources, so it includes additional verbs like _create_, _update_, _patch_, _delete_

Here’s a brief overview of the most commonly used verbs:

- `get`: Allows reading a specific resource.
- `list`: Allows listing all resources of a specific type.
- `watch`: Allows watching resources and receiving updates when they change.
- `create`: Allows creating new resources.
- `update`: Allows updating existing resources.
- `patch`: Allows partially updating existing resources.
- `delete`: Allows deleting resources.
- `deletecollection`: Allows deleting a collection of resources

## Apply the RBAC Resources

```sh
kubectl apply -f .\editor-sa.yaml -f .\viewer-sa.yaml -f .\viewer-role.yaml -f .\editor-role.yaml -f .\editor-role-bindinding.yaml -f .\viewer-role-binding.yaml -n tst
```

### Clean up Command

```sh
kubectl delete -f .\viewer-sa.yaml -f .\editor-sa.yaml -f .\viewer-role-binding.yaml -f .\editor-role-bindinding.yaml -f .\editor-role.yaml -f .\viewer-role.yaml -n tst
```

## Verify the RBAC
- To view whether certain permission is there with the service account follow this command `kubectl auth can-i <resourcetype> -n <namespace> --as=system:serviceaccount:<namespace>:<service account name>`

> while configuring RBAC on a service account use this `as` flag: --as=system:serviceaccount:_namespace_:_service account name_

```sh
kubectl auth can-i create deployments -n tst --as=system:serviceaccount:tst:viewer
kubectl auth can-i create deployments -n tst --as=system:serviceaccount:tst:editor
```

> namespace name : `tst`
> service account names : `viewer` , `editor`
> This command should return `yes` if the permission is there with the service account

- To get the resources via the service account follow this command
`kubectl get <resourcetype> -n <namespace> --as=system:serviceaccount:<namespace>:<service account name>`

```sh
kubectl get pods -n tst --as=system:serviceaccount:tst:viewer
```

> change the `verb` (get) and the `resource type` (pods) based on the requirement

## RBAC Best Practices

### 1. Least Privilege Principle

- Minimize Permissions: Grant only the minimum necessary permissions. Avoid using broad permissions like ClusterRole with * verbs unless absolutely necessary.
- Namespace Isolation: Use namespaces to isolate resources and restrict access to them using Role and RoleBinding

### 2. Use Groups and Service Accounts

- Group Management: Use groups to manage permissions for multiple users collectively, especially when integrating with identity providers like AD.
- Service Accounts for Automation: Use service accounts for applications and automation tasks instead of using user credentials

### 3. Consistent Naming Conventions

- Naming: Use consistent and descriptive naming conventions for roles, bindings, and service accounts to improve readability and maintainability