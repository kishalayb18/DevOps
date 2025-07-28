+------------------+
|  GitHub / Repo   | <-- PR approval, branch protection, signed commits
+------------------+
         |
         v
+--------------------------+
|  Cloud Build Trigger     | <-- IAM-restricted, auto-trigger on tag/branch
+--------------------------+
         |
         v
+--------------------------+
|  Build & Scan Image      |  <-- Buildpacks or Docker, 
|  (Container Analysis)    |      CVE scans (GCR vulnerability scanning)
+--------------------------+
         |
         v
+--------------------------+
|  Sign Image (Cosign)     | <-- Provenance attestation
+--------------------------+
         |
         v
+-------------------------------+
|  Store in Artifact Registry   | <-- Private repo, CMEK encryption
+-------------------------------+
         |
         v
+------------------------------+
|  Binary Authorization Gate   | <-- Enforces only signed images in prod
+------------------------------+
         |
         v
+-------------------------------+
|  Cloud Deploy / ArgoCD       | <-- Approvals for Prod, GitOps CD
|  (Scoped IAM / RBAC)         |
+-------------------------------+
         |
         v
+------------------------------+
|  GKE / Cloud Run             | <-- mTLS, private clusters, restricted egress
+------------------------------+
         |
         v
+-----------------------------+
|  Cloud Monitoring + Logs    | <-- Alerting on audit anomalies, access logs
+-----------------------------+
