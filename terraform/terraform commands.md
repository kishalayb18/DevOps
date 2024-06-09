# Terraform Commands
This file provides a comprehensive list of Terraform commands for managing infrastructure as code. Each command is explained and can be copied directly for use. The commands are organized to cover various aspects of Terraform usage, from initialization to state management and workspace handling.

## Table of Contents

1. [Basic Commands](#basic-commands)
    1. [Initialize Terraform configuration](#initialize-terraform-configuration)
    2. [Validate the configuration](#validate-the-configuration)
    3. [Format configuration files](#format-configuration-files)
    4. [Show formatted configuration](#show-formatted-configuration)
    5. [Plan changes](#plan-changes)
    6. [Apply changes](#apply-changes)
    7. [Apply changes without prompting for confirmation](#apply-changes-without-prompting-for-confirmation)
    8. [Destroy managed infrastructure](#destroy-managed-infrastructure)
    9. [Destroy managed infrastructure without prompting for confirmation](#destroy-managed-infrastructure-without-prompting-for-confirmation)
    10. [Show the current state or a saved plan](#show-the-current-state-or-a-saved-plan)
    11. [Output variables](#output-variables)
    12. [List resources in the state file](#list-resources-in-the-state-file)
    13. [Get detailed information about a specific resource](#get-detailed-information-about-a-specific-resource)
3. [Intermediate Commands](#intermediate-commands)
    1. [Refresh the state file](#refresh-the-state-file)
    2. [Import existing infrastructure](#import-existing-infrastructure)
    3. [Graph the dependency tree](#graph-the-dependency-tree)
    4. [Generate and show an execution plan](#generate-and-show-an-execution-plan)
    5. [Apply a saved execution plan](#apply-a-saved-execution-plan)
    6. [Manage workspace](#manage-workspace)
    7. [State manipulation commands](#state-manipulation-commands)
        1. [Remove a resource from the state file](#remove-a-resource-from-the-state-file)
        2. [Rename a resource in the state file](#rename-a-resource-in-the-state-file)
        3. [Pull the state from the backend](#pull-the-state-from-the-backend)
        4. [Push the state to the backend](#push-the-state-to-the-backend)
4. [Advanced Commands](#advanced-commands)
    1. [Workspace management](#workspace-management)
    2. [State file locking and unlocking](#state-file-locking-and-unlocking)
    3. [Debugging and logging](#debugging-and-logging)
    4. [Generate a plan and save output](#generate-a-plan-and-save-output)
    5. [Apply the saved plan](#apply-the-saved-plan)
    6. [Remove a specific resource from state](#remove-a-specific-resource-from-state)
    7. [Move a resource within the state file](#move-a-resource-within-the-state-file)
    8. [Replace a resource](#replace-a-resource)
    9. [Unmark a resource for recreation](#unmark-a-resource-for-recreation)
    10. [Override backend configuration](#override-backend-configuration)
    11. [Display the current backend configuration](#display-the-current-backend-configuration)
    12. [Validate and lint a configuration](#validate-and-lint-a-configuration)
    13. [Show the current state of outputs](#show-the-current-state-of-outputs)
    14. [Capture and display detailed logs](#capture-and-display-detailed-logs)
    15. [Enable auto-approval for quicker execution](#enable-auto-approval-for-quicker-execution)
    16. [Force unlock the state file](#force-unlock-the-state-file)
    17. [Generate dependency graph](#generate-dependency-graph)

## Basic Commands
1. Initialize Terraform configuration
```
terraform validate
```

2. Validate the configuration
```

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
