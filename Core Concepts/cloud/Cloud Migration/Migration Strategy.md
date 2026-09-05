 # Google Cloud Migration Strategy

This guide describes a repeatable approach for assessing workloads, building a Google Cloud foundation, migrating applications and data, and optimizing the resulting environment. It is intended for platform teams, application owners, security teams, and project stakeholders who need a practical migration roadmap.

The migration lifecycle is:

1. Assess and discover workloads.
2. Plan and build the Google Cloud foundation.
3. Deploy workloads in controlled migration waves.
4. Optimize the environment after migration.

Migration is not only a data-center exit exercise. A successful program preserves business capabilities, reduces operational risk, improves resilience, and creates a platform that teams can operate consistently.

## 1. Assess and Discover Your Workloads

### Define the source and target environments

Document both environments before selecting a migration pattern.

The **source environment** may include on-premises data centers, colocation facilities, other public clouds, branch offices, SaaS products, and legacy platforms. Record the applications, virtual machines, databases, storage systems, network paths, identity providers, licensing constraints, and operational processes that currently support the business.

The **target environment** should describe the Google Cloud regions, projects, folders, networks, security controls, service types, availability requirements, and operating model that will host the migrated workloads.

At minimum, capture:

| Area | Questions to answer |
| --- | --- |
| Workload | What does the application do? Who owns it? What business process depends on it? |
| Runtime | What operating system, runtime, middleware, libraries, and versions are required? |
| Data | What data is stored, how large is it, how fast does it change, and how long must it be retained? |
| Dependencies | Which databases, APIs, queues, identity systems, DNS zones, and external services are required? |
| Network | Which ports, protocols, routes, proxies, firewalls, and latency requirements exist? |
| Resilience | What are the recovery point objective (RPO), recovery time objective (RTO), availability target, and disaster recovery region? |
| Security | What data classification, encryption, audit, regulatory, and access requirements apply? |
| Operations | How are deployments, backups, monitoring, patching, incident response, and support handled today? |
| Cost | What are the current infrastructure, license, support, data-transfer, and people costs? |

### 1. Build an inventory of your workloads

Create a single inventory and make an accountable owner responsible for keeping it current. An inventory entry should identify the workload, its components, its dependencies, and the evidence used to estimate its resource requirements.

Useful inventory fields include:

- Workload name, business owner, technical owner, and support team.
- Environment and location, such as production, test, development, or disaster recovery.
- Servers, virtual machines, containers, databases, file shares, and storage volumes.
- CPU, memory, disk, IOPS, throughput, peak usage, and growth rate.
- Network flows, inbound and outbound consumers, and required latency.
- Data sensitivity, retention, backup, encryption, and residency requirements.
- Licensing, operating-system compatibility, and vendor-support constraints.
- Availability, RPO, RTO, maintenance window, and downtime tolerance.
- Current cost and estimated Google Cloud cost.
- Recommended migration strategy, migration wave, risks, and acceptance owner.

Google Cloud Migration Center can help discover assets, organize migration data, estimate cloud spend, and recommend Google Cloud resources. Discovery results should still be reviewed with application owners because automated discovery cannot fully identify business criticality or undocumented dependencies.

### 2. Categorize your workloads

Group workloads using criteria that affect migration risk and sequencing:

- **Business criticality:** mission-critical, important, or non-critical.
- **Technical complexity:** standalone, dependent, tightly coupled, or legacy.
- **Data sensitivity:** public, internal, confidential, or regulated.
- **Migration readiness:** ready, needs remediation, or blocked by a dependency.
- **Change tolerance:** can tolerate downtime, requires a short outage, or requires near-zero downtime.
- **Target pattern:** virtual machines, containers, managed services, serverless, SaaS, or retirement.

This categorization supports migration waves. Start with representative, low-risk workloads that can teach the team the migration process without putting the most critical business functions at risk.

### 3. Design the target architecture

Design the target architecture from workload requirements rather than from the source topology alone. Decide which responsibilities should remain in the application, which should move to managed services, and which should be removed.

Common Google Cloud target services include:

| Requirement | Potential Google Cloud services |
| --- | --- |
| Virtual machines | Compute Engine, Managed Instance Groups |
| Kubernetes workloads | Google Kubernetes Engine (GKE) |
| Serverless containers | Cloud Run |
| Object storage and backups | Cloud Storage |
| Relational databases | Cloud SQL, AlloyDB, or another managed database selected for the workload |
| Analytics and data warehouse | BigQuery |
| Messaging and eventing | Pub/Sub |
| Global content delivery | Cloud CDN |
| Private connectivity | Cloud VPN or Cloud Interconnect |
| Identity and access | Cloud Identity and Identity and Access Management (IAM) |
| Operations | Cloud Monitoring, Cloud Logging, Cloud Trace, and Error Reporting |

The architecture should define regions and zones, failure domains, network segmentation, ingress and egress paths, secrets handling, encryption, backup and recovery, deployment processes, observability, and ownership boundaries.

### 4. Calculate your cloud spend

Build a cost model for both the migration period and the steady state. Include temporary duplication when the source and target environments run in parallel.

Consider:

- Compute, memory, persistent disks, snapshots, and machine types.
- Managed database instances, storage, backups, and replicas.
- GKE cluster management, nodes, load balancing, and persistent storage.
- Cloud Run requests, CPU, memory, networking, and minimum instances.
- Cloud Storage capacity, operations, retrieval, and replication.
- Data transfer, including ingress, egress, regional, and zonal traffic.
- Logging volume, monitoring metrics, traces, retention, and exports.
- Software licenses, support plans, third-party products, and migration tools.
- Engineering effort, training, parallel operations, and decommissioning.

Use budgets, labels, billing accounts, and cost reports to make ownership visible. Treat the first estimate as a range and update it with observed utilization after the first migration wave.

## 2. Choose a Migration Strategy and Tools

There is no single strategy for every workload. Select a strategy per workload based on business value, time constraints, technical debt, risk, and the expected benefit of modernization.

### Rehost: lift and shift

Rehosting moves a workload as-is with minimal application changes. A common target is Compute Engine.

**Use rehosting when:** speed is the primary objective, the workload is stable, the application cannot yet be changed safely, or the organization needs to exit a facility quickly.

**Trade-offs:** it usually has the lowest initial application effort, but it may preserve operational overhead, licensing costs, and architecture limitations.

### Replatform: lift and optimize

Replatforming moves a workload and makes limited changes to use cloud capabilities. Examples include moving a database to a managed database service, moving a VM-based service to containers, or deploying containers on GKE or Cloud Run.

**Use replatforming when:** the workload is understood, a targeted platform change provides clear operational or cost benefits, and the team can test the new runtime within the migration schedule.

### Refactor: move and improve

Refactoring changes the application code while preserving its external behavior. Code may be split into more modular components, dependencies may be updated, and cloud services may replace custom infrastructure.

**Use refactoring when:** the existing code can be improved incrementally and the organization needs better maintainability, performance, or deployment speed without changing the user experience.

### Rearchitect: continue to modernize

Rearchitecting changes how the application functions so it can use cloud-native properties such as independent scaling, resilience, security, and agility. A monolith might become several independently deployable services.

**Use rearchitecting when:** the current architecture prevents required scale, reliability, release velocity, or security outcomes. This approach requires stronger domain knowledge, testing, and change management than rehosting.

### Rebuild: remove and replace

Rebuilding rewrites the application for Google Cloud. It is sometimes easier to create a new cloud-native implementation than to adapt old code with obsolete dependencies or unsupported platforms.

**Use rebuilding when:** the existing application has low strategic value, severe technical debt, unavailable source expertise, or requirements that cannot be met economically through incremental change.

### Repurchase: move to SaaS

Repurchasing replaces an on-premises workload with a cloud-hosted software-as-a-service product. An example is replacing local collaboration software and file storage with Google Workspace.

**Use repurchasing when:** a mature SaaS product meets the business requirements and the organization prefers to reduce platform ownership.

**Trade-offs:** implementation may be simpler, but subscription costs, vendor dependency, integration limits, and reduced control must be assessed.

### Retire and retain

Although not included in the six modernization strategies, two decisions should also be explicit:

- **Retire:** remove an application or capability that is unused, duplicated, or no longer justified.
- **Retain:** keep a workload in its current environment temporarily or permanently when migration cost, risk, regulation, or dependency constraints outweigh the benefit.

### Select migration tools

Choose tools based on the workload and the migration operation required. Possible tools and capabilities include:

- **Migration Center:** discovery, assessment, planning, and cost estimation.
- **VM migration tooling:** replication, test cloning, and cutover for virtual machines to Compute Engine.
- **Database migration tooling:** continuous or staged migration for supported database engines.
- **Storage transfer tooling:** transfer large datasets into Cloud Storage.
- **Terraform:** repeatable infrastructure provisioning and policy-controlled change management.
- **Cloud Build and Cloud Deploy:** build, test, and release automation.
- **Migrate to Containers:** support for converting suitable VM workloads into container images.
- **GKE and Cloud Run:** managed platforms for containerized workloads.

Validate tool support for the source operating system, database engine, data size, network connectivity, downtime requirement, encryption, and rollback behavior before committing to a migration wave.

## 3. Validate the Migration Approach

### Design a proof of concept

A proof of concept (PoC) should answer a small number of high-risk questions. It should not become an unbounded production rewrite.

Define:

1. The workload and business scenario being tested.
2. The assumptions and risks to validate.
3. Success measures, such as latency, throughput, recovery time, compatibility, and cost.
4. The test data, security controls, and network paths required.
5. The rollback and cleanup process.
6. The decision that will follow each possible result.

Good PoC candidates include a representative VM, a difficult database, a dependency-heavy application, a network path with strict latency requirements, or a workload that is planned for replatforming.

### Create a migration plan

The migration plan should turn the strategy into executable work. For every workload or wave, define:

- Scope, owner, dependencies, and target architecture.
- Pre-migration remediation and required approvals.
- Migration tooling, sequence, data synchronization, and downtime window.
- Validation tests and acceptance criteria.
- Communications plan and stakeholder contacts.
- Cutover, rollback, and source-environment protection steps.
- Monitoring, support coverage, and hypercare period.
- Decommissioning conditions and evidence required for closure.

### Validate the migration plan

Review the plan with application, database, network, security, operations, finance, and business owners. Conduct a tabletop exercise for cutover and rollback. Confirm that the team can answer these questions before production migration:

- What happens if the workload loses network connectivity?
- Can it resume from its last consistent state after an interruption?
- How long does the required data transfer take at the measured bandwidth?
- What is the maximum acceptable data loss and downtime?
- How will users know that the cutover succeeded?
- What conditions trigger rollback, and how long will rollback take?
- Which source systems must remain available during the transition?
- What conditions must be met before the source environment can be retired?

## 4. Plan and Build the Google Cloud Foundation

Before migrating production workloads, establish the controls that make the environment secure, repeatable, and operable.

### Establish organization, billing, and identity

#### 1. Build the resource hierarchy

Use the Google Cloud organization, folders, projects, and resources to reflect business ownership, environments, and security boundaries. Keep production, non-production, shared services, and security functions separated where appropriate.

Define conventions for:

- Project and folder names.
- Resource labels and cost-allocation metadata.
- Regions and zones.
- Ownership and support contacts.
- Environment boundaries.
- Shared services and service projects.

#### 2. Set up billing

Create a billing ownership model with budgets, alerts, cost centers, and regular reporting. Decide who can create projects, attach billing accounts, approve exceptions, and investigate unexpected spend.

#### 3. Configure IAM

IAM defines who can do what on Google Cloud resources. Use groups and service accounts instead of individual long-lived credentials where possible. Grant the minimum roles required, prefer predefined roles over broad primitive roles, and review access regularly.

Consider:

- Who administers, controls, and audits Google Cloud access?
- How will users and applications authenticate securely?
- Which identities are human, workload, federated, or temporary?
- How will existing security and access policies change in Google Cloud?
- How will privileged access be approved, monitored, and revoked?
- How will service account keys be avoided, rotated, and audited when unavoidable?

### Configure networking and security

#### 4. Set up network connectivity

Design the Virtual Private Cloud (VPC), subnets, routes, firewall rules, load balancers, DNS, and private service access before moving dependent workloads.

Connectivity may use Cloud VPN for encrypted tunnels or Cloud Interconnect for higher-throughput, lower-latency private connectivity. Coordinate routes and DNS with the source environment.

Verify that:

- DNS records resolve correctly across the source and Google Cloud environments.
- Network routes propagate correctly in both directions.
- Required ports and protocols are allowed by firewalls and security controls.
- Shared VPC and project boundaries match the operating model.
- Private access is used where public exposure is not required.
- Data transfer costs are included in the architecture and cost model.

Use software-defined networking and infrastructure as code, such as Terraform, for consistent and reviewable network setup.

#### 5. Harden security

Apply defense in depth across identity, network, compute, data, and operations. Define encryption requirements, secret storage, vulnerability management, patching, audit logging, organization policies, and incident response before production cutover.

Security design should address:

- Least-privilege IAM and separation of duties.
- Organization policies and constraints.
- Encryption in transit and at rest, including key management requirements.
- Private access, ingress controls, egress controls, and firewall logging.
- Secret Manager or an approved secret-management integration.
- Vulnerability scanning, image provenance, and patching.
- Audit log retention, access, export, and alerting.
- Backup isolation, recovery testing, and ransomware resilience.

### Set up governance and monitoring

#### 6. Develop a governance strategy

Governance is the rulebook for the cloud environment. Define how resources are named, tagged, deployed, accessed, monitored, and retired so that usage remains consistent, compliant, and organized as the environment grows.

Document:

- Who may create projects and resources.
- Which services, regions, machine types, and public endpoints are allowed.
- Required labels, owners, environments, and cost centers.
- Approval paths for exceptions.
- Data classification and retention rules.
- Backup, disaster recovery, and decommissioning requirements.
- Configuration drift, policy violations, and remediation ownership.

#### 7. Set up observability

Cloud Monitoring, Cloud Logging, and Cloud Trace are available as core Google Cloud operations services. Configure them intentionally for each workload rather than assuming default settings meet production needs.

Define:

- Golden signals: latency, traffic, errors, and saturation.
- Application, infrastructure, audit, and security logs.
- Dashboards and alerts tied to service-level objectives.
- Trace and correlation identifiers for distributed requests.
- Log and metric retention, routing, and cost controls.
- On-call ownership, escalation, and incident runbooks.

### When to use infrastructure as code

Use infrastructure as code (IaC) when the environment will change frequently, must be reproduced across environments, or requires reviewable governance. Terraform lets teams manage infrastructure through version-controlled configuration rather than manual console changes.

Benefits include:

- Repeatable environments and faster recovery.
- Peer review and change history.
- Consistent naming, labels, and policy.
- Reduced configuration drift.
- Easier testing and promotion from development to production.
- A documented representation of the platform.

Use remote state protection, state access controls, reusable modules, environment separation, automated validation, and controlled deployment pipelines. Keep secrets out of source control and state wherever possible.

## 5. Deploy the Workloads

### Create a sprint plan

Break the migration plan into executable sprints and group workloads into logical waves based on dependencies, business priority, risk, and complexity.

A wave plan should identify:

- Workloads and shared dependencies in the wave.
- Entry criteria and required remediation.
- Migration sequence and owners.
- Test, cutover, rollback, and communications windows.
- Acceptance criteria and hypercare duration.
- Lessons learned and changes to the next wave.

Protect the schedule with explicit entry and exit criteria. A workload that is not ready should move to a later wave instead of weakening the controls for the current wave.

### Deploy the first migration wave

Treat the first wave as a controlled learning exercise. Choose workloads that are representative but have manageable business risk. Capture metrics, decisions, defects, timing, and operator feedback.

A typical virtual-machine migration flow is:

| Step | Activity |
| --- | --- |
| 1 | Install a lightweight migration appliance on or near the on-premises source VMs. |
| 2 | Replicate disk data to Compute Engine while source VMs continue running. |
| 3 | Launch test clones in Google Cloud and verify boot, application behavior, network access, performance, and monitoring. |
| 4 | Initiate cutover. Synchronize final changes, stop the source VMs, and power on the Compute Engine VMs. |
| 5 | Run business and technical validation, monitor the workload, and retain the rollback path until acceptance is complete. |

The exact tools and steps depend on the source platform and workload. Validate the selected migration product's current support matrix before execution.

### Validate the migrated workload

Validation should include more than a successful VM boot:

- Application health checks and user acceptance tests.
- Database consistency and transaction verification.
- Integration with identity, DNS, APIs, queues, and external systems.
- Performance against the agreed baseline.
- Backup and restore testing.
- Monitoring, alerting, logging, and on-call routing.
- Security controls, audit events, and vulnerability status.
- Cost and capacity compared with the approved estimate.

### Execute the remaining migration waves

Use the first wave's evidence to improve the runbooks, automation, estimates, and acceptance tests. The remaining waves should become a repeatable process in which the team can migrate, validate, support, and close workloads consistently.

Do not decommission the source environment immediately after cutover. Retain it until business acceptance, data reconciliation, backup verification, rollback expiry, and compliance requirements have been satisfied.

## 6. Optimize the Google Cloud Environment

Optimization is continuous. Review performance, reliability, security, and cost after workloads have reached normal operating levels.

### Performance monitoring

- Monitor workloads and cloud usage with Cloud Monitoring and Cloud Logging.
- Create dashboards and alerts for performance thresholds and service-level objectives.
- Compare post-migration latency and throughput with the source baseline.
- Implement caching for frequently accessed data where consistency permits.
- Use Cloud CDN to improve delivery of suitable content.
- Review logs, traces, and slow requests to find application bottlenecks.

### Rightsizing and autoscaling

- Use labels and ownership metadata to manage resources.
- Analyze actual CPU, memory, disk, and network utilization.
- Adjust machine types, node pools, storage, and database tiers based on observed usage.
- Apply suitable recommendations from Active Assist and Google Cloud recommender tools after reviewing workload constraints.
- Configure autoscaling for variable workloads and test scale-up and scale-down behavior.
- Use bursting or elastic capacity where it improves user experience and is financially justified.

### Cost optimization and discounts

- Set budgets, alerts, and regular cost reviews with Cloud Billing.
- Remove unattached disks, obsolete snapshots, unused IP addresses, and idle resources.
- Use lower-cost or preemptible capacity for workloads that can tolerate interruption.
- Evaluate committed-use discounts for stable, predictable consumption.
- Select storage classes and retention policies based on access patterns.
- Reduce unnecessary cross-region, cross-zone, and internet traffic.
- Revisit architecture and network flows for data-intensive workloads.

Cost optimization should not reduce availability or security accidentally. Record the expected benefit, risk, owner, and rollback for material changes.

### Automation and DevOps

- Manage infrastructure with Terraform or an equivalent approved IaC tool.
- Use CI/CD pipelines for application and infrastructure changes.
- Use Cloud Build and Cloud Deploy where they fit the team's delivery model.
- Add automated tests, policy checks, vulnerability checks, and deployment approvals.
- Use progressive delivery, health checks, and rollback automation.
- Keep operational runbooks close to the code and update them after incidents.

### Managed services and AI

Reduce undifferentiated operational work when a managed service meets the requirements:

- Use GKE for Kubernetes workloads that need Kubernetes capabilities and control.
- Use Cloud Run for stateless container workloads that benefit from serverless operations.
- Use managed databases and messaging where they meet availability, performance, and compatibility needs.
- Use Vertex AI and Gemini capabilities to build appropriate generative AI experiences, such as intelligent assistants, personalized content, and developer or operations tools.

AI workloads require additional governance for data privacy, model access, evaluation, safety, cost, and human oversight. Treat AI adoption as an architecture and risk decision, not only as a service integration.

## Migration Completion Checklist

### Discovery and planning

- [ ] Every workload has an owner, classification, dependency map, and target state.
- [ ] RPO, RTO, availability, security, compliance, and downtime requirements are documented.
- [ ] Cloud spend estimates include migration overlap and network transfer.
- [ ] A strategy and migration tool are selected for each workload.
- [ ] PoC results and unresolved risks are recorded.

### Foundation

- [ ] Resource hierarchy, projects, billing, budgets, and labels are configured.
- [ ] IAM groups, service accounts, roles, and privileged access are reviewed.
- [ ] Connectivity, DNS, routes, firewalls, and private access are tested.
- [ ] Security, backup, encryption, logging, monitoring, and incident processes are defined.
- [ ] Terraform or another approved IaC process manages repeatable infrastructure.

### Migration execution

- [ ] Each wave has entry criteria, test cases, cutover steps, rollback steps, and owners.
- [ ] Test clones or non-production migrations have been validated where possible.
- [ ] Data synchronization and final cutover timing have been measured.
- [ ] Business and technical acceptance tests pass.
- [ ] Hypercare monitoring and support coverage are active.
- [ ] Source retirement criteria have been approved and evidenced.

### Optimization

- [ ] Performance and cost are compared with the migration baseline.
- [ ] Resources are rightsized and autoscaling is tested.
- [ ] Budgets, alerts, dashboards, and ownership reports are working.
- [ ] CI/CD, IaC, security scanning, and operational runbooks are integrated.
- [ ] Lessons learned are applied to the next workload or migration program.

## Summary

A successful Google Cloud migration combines accurate discovery, an explicit strategy, a secure foundation, controlled migration waves, and continuous optimization. Migration Center can support assessment and planning, while services such as Compute Engine, GKE, Cloud Run, Cloud Storage, Cloud SQL, Cloud Monitoring, Cloud Logging, Terraform, Cloud Build, and Cloud Deploy provide building blocks for execution and operations.

The most important outcome is not simply moving workloads. It is establishing a repeatable way for the organization to deliver secure, observable, resilient, and cost-aware services on Google Cloud.
