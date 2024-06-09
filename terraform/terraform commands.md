# Terraform Commands
This file provides a comprehensive list of Terraform commands for managing infrastructure as code. Each command is explained and can be copied directly for use. The commands are organized to cover various aspects of Terraform usage, from initialization to state management and workspace handling.


## Basic Commands
1. Initialize Terraform configuration
```
terraform init

```

2. Validate the configuration
```
terraform validate
```

3. Format configuration files
```
terraform fmt
```

4. Show formatted configuration
```
terraform fmt -check
```

5. Plan changes
```
terraform plan
```
Generate and show an execution plan
```
terraform plan -out=plan.tfplan
```

6. Apply changes
```
terraform apply
```
Apply a saved execution plan
```
terraform apply "plan.tfplan"
```
Apply changes without prompting for confirmation
```
terraform apply -auto-approve
```

7. Destroy managed infrastructure
```
terraform destroy
```

Destroy managed infrastructure without prompting for confirmation
```
terraform destroy -auto-approve
```

8. Replace a resource
```
terraform taint <resource_name>
```

9. Unmark a resource for recreation
```
terraform untaint <resource_name>
```

10. Show the current state or a saved plan
```
terraform show
```

11. Output variables
```
terraform output
```

12. List resources in the state file
```
terraform state list
```

13. Get detailed information about a specific resource
```
terraform state show <resource_name>
```

## Statefile Commands
14. Updates the state file with the real-world state of resources.
```
terraform refresh
```

15. Imports existing infrastructure into Terraform's state.
```
terraform import <resource_type>.<resource_name> <id>
```

16. Remove a resource from the state file
```
terraform state rm <resource_name>
```

17. Rename a resource in the state file
```
terraform state mv <old_name> <new_name>
```

17. Pull the state from the backend
```
terraform state pull
```

18. Push the state to the backend
```
terraform state push
```

19. State file locking and unlocking
```
terraform force-unlock <lock_id>
```

## Manage Workplace
20. Create a new workspace
```
terraform workspace new <workspace_name>
```

21. Select a workspace
```
terraform workspace list
```
