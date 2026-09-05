## Why Terraform?

While you could use kubectl or similar CLI-based tools mapped to API calls to manage all Kubernetes resources described in YAML files, orchestration with Terraform presents a few benefits:

- One language - You can use the same configuration language to provision the Kubernetes infrastructure and to deploy applications into it.
- Drift detection - terraform plan will always present you the difference between reality at a given time and the config you intend to apply.
- Full lifecycle management - Terraform doesn't just initially create resources, but offers a single command to create, update, and delete tracked resources without needing to inspect the API to identify those resources.
- Synchronous feedback - While asynchronous behavior is often useful, sometimes it's counter-productive as the job of identifying operation results (failures or details of created resource) is left to the user. e.g. you don't have the IP/hostname of the load balancer until it has finished provisioning, hence you can't create any DNS record pointing to it.
- Graph of relationships - Terraform understands relationships between resources which may help in scheduling - e.g. Terraform won't try to create a service in a Kubernetes cluster until the cluster exists.

## Terraform Folder Structure
terraform-project/ <br>
│ <br>
├── main.tf # Primary configuration file <br>
├── variables.tf # Variable definitions<br>
├── outputs.tf # Output definitions<br>
├── terraform.tfvars # Values for the variables<br>
├── provider.tf # Provider configurations<br>
├── modules/ # Directory for reusable modules<br>
│ └── module_name/ # Example module<br>
│ ├── main.tf<br>
│ ├── variables.tf<br>
│ └── outputs.tf<br>
├── environments/ # Environment-specific configurations<br>
│ └── dev/<br>
│ ├── main.tf<br>
│ ├── variables.tf<br>
│ └── outputs.tf<br>
