# GKE Private Cluster Traffic Flows

## Overview
This document explains how **traffic flows** in a **GKE Private Cluster** setup with Istio service mesh, covering:
- Public traffic from clients
- Internal service-to-service communication
- Cross-VPC / private service connections
- Headless services for stateful workloads
- Egress traffic to the internet

---

## Public Traffic Flow (External Clients)
For **public-facing applications**, traffic typically enters through a **Google Cloud Armor protected load balancer** and flows into the cluster via **Ingress** and Istio.

**Flow:**
```
Client
   ↓
Cloud Armor (WAF / DDoS Protection)
   ↓
External HTTPS Load Balancer
   ↓
Ingress Controller (NGINX / GKE Ingress)
   ↓
Istio Gateway / Istio Sidecar
   ↓
Kubernetes Service (ClusterIP)
   ↓
Pods
```

---

## Internal Service-to-Service Communication
Within the cluster, **Istio sidecars** handle service-to-service communication using **mutual TLS (mTLS)** for authentication and encryption.

**Flow:**
```
Pod A → Istio Sidecar
   ↓
mTLS Encrypted Connection
   ↓
Pod B → Istio Sidecar
   ↓
Application Container
```

### Benefits:
- Zero-trust, identity-based authentication
- Prevents service impersonation
- Fine-grained authorization with Istio policies

---

## Cross-VPC / Private Service Connections
When workloads in one VPC need to connect securely to services in another (e.g., databases, APIs), **Private Service Connect (PSC)** or **VPC Peering** is used.

**Flow:**
```
Pod (Private IP)
   ↓
Istio Sidecar (Optional)
   ↓
VPC Peering / Private Service Connect
   ↓
Producer VPC Service (DB, API, etc.)
```

This keeps the traffic **within Google’s private backbone**.

---

## Headless Service for Stateful Workloads
For databases and stateful workloads (e.g., **PostgreSQL, Cassandra, Kafka**), headless services (`ClusterIP: None`) expose each pod with a **stable DNS entry**.

**Flow:**
```
App Pod
   ↓
Headless Service DNS Lookup
   ↓
Pod-specific FQDN (e.g., mysql-0.mysql-headless.default.svc.cluster.local)
   ↓
StatefulSet Pod (Primary / Replica)
```

### Benefit
direct pod-to-pod communication, primary/replica awareness.

---

## Egress Path (Outbound Internet Access)
Private clusters have no public IPs. Outbound traffic must pass through **Istio EgressGateway + Cloud NAT**.

**Flow:**
```
Pod
   ↓
Istio Sidecar
   ↓
Istio Egress Gateway
   ↓
Cloud Router + Cloud NAT
   ↓
Internet (Public APIs, SaaS, etc.)
```

### Best practice:
- Restrict domains with Istio Egress policies (e.g., only `api.stripe.com`)
- Use VPC firewall rules + NAT logging for monitoring

---

## Traffic Flow Diagram
![Kubernetes Traffic Flow](../png/Kubernetes%20Traffic%20Flow.png)
- Always terminate public traffic at **Cloud Armor + External LB**
- Enforce **mTLS** for all internal service-to-service communication
- Use **Private Service Connect** for cross-VPC secure calls
- Use **Headless Services** only for stateful workloads
- Centralize outbound traffic with **Istio EgressGateway + Cloud NAT**

---

### References
- [GCP Cloud Armor](https://cloud.google.com/armor/docs)
- [GKE Ingress](https://cloud.google.com/kubernetes-engine/docs/concepts/ingress)
- [Istio mTLS](https://istio.io/latest/docs/tasks/security/authentication/mtls-migration/)
- [Private Service Connect](https://cloud.google.com/vpc/docs/private-service-connect)
- [Headless Services](https://kubernetes.io/docs/concepts/services-networking/service/#headless-services)
- [Istio Egress Gateway](https://istio.io/latest/docs/tasks/traffic-management/egress/egress-gateway/)
