# Secure Three-Tier Kubernetes Architecture with NetworkPolicies

## 1. Architecture Overview
This design implements a **three-tier application** on Kubernetes, with each tier placed in a dedicated namespace to enforce strict isolation.  

- **Frontend (fe-ns)** – exposed to a trusted external CIDR.  
- **Backend (be-ns)** – internal API services, only accessible from the frontend.  
- **Database (db-ns)** – restricted data layer, only accessible from the backend.  

---

## 2. Network Flow Controls

### 2.1 Frontend (fe-ns)
- **Ingress**: Only allowed from a defined trusted external CIDR.  
- **Egress**: Restricted to the Backend service in `be-ns` on TCP port 80.  
- **Blocked**: Direct communication to the Database or any other namespace.  

### 2.2 Backend (be-ns)
- **Ingress**: Only allowed from Frontend pods in `fe-ns`.  
- **Egress**: Restricted to Database pods in `db-ns` on TCP port 80.  
- **Blocked**: Direct internet access or communication with unrelated services.  

### 2.3 Database (db-ns)
- **Ingress**: Only allowed from Backend pods in `be-ns`.  
- **Egress**: Denied by default, preventing outbound connections.  
- **Blocked**: Direct access from Frontend or external sources.

---

## 3. Security Measures

### 3.1 Namespace Isolation
- Each tier operates in its own namespace: `fe-ns`, `be-ns`, `db-ns`.  
- Reduces the **blast radius** in case of compromise.  
- Simplifies RBAC and network scoping.  

### 3.2 Default Deny Policy
- Every namespace enforces a **default deny-all** policy for ingress and egress.  
- Implements **Zero Trust networking**: no communication is permitted unless explicitly allowed.  

### 3.3 Principle of Least Privilege
- Communication paths are tightly restricted to only what is required:  
  - Frontend → Backend  
  - Backend → Database  
- Prevents **lateral movement** across pods and namespaces.  

### 3.4 Restricted Egress
- Frontend pods cannot bypass the backend to access the database.  
- Database pods cannot initiate outbound requests (prevents data exfiltration).  
- Backend pods are not permitted to access the internet directly.  

### 3.5 Resource Isolation
- CPU and memory requests/limits are set for all deployments to:  
  - Ensure predictable resource usage.  
  - Mitigate denial-of-service by resource exhaustion.  

### 3.6 Defense in Depth
- Multi-layered controls:  
  - Namespace separation.  
  - NetworkPolicies at pod level.  
  - Resource constraints.  
- Aligns with **Zero Trust principles** and compliance standards such as PCI-DSS and HIPAA.  

---

## 4. Security Benefits
- **Zero Trust by default**: no implicit trust between workloads.  
- **Controlled ingress/egress**: minimizes attack surface.  
- **Strong segmentation**: prevents unauthorized access between tiers.  
- **Compliance readiness**: meets industry security and audit requirements.  
- **Resilience**: compromised pods cannot escalate or pivot laterally.  

---

## 5. Future Enhancements
- Implement **mTLS** between services using a service mesh (e.g., Istio, Linkerd).  
- Store database credentials in **Secrets** or external secret managers (Vault, GCP Secret Manager).  
- Apply **Pod Security Standards** (restricted profiles).  
- Integrate **logging and monitoring** for policy enforcement visibility.  
- Deploy **WAF and DDoS protections** at ingress.  
