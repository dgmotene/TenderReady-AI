# 0003: One Terraform module per component
Status: accepted
Context: A single flat folder gets hard to read as the stack grows.
Decision: Group resources into modules by component (storage, database, auth, api), plus one reusable lambda_function module.
Consequences: Each module has its own main.tf, variables.tf and outputs.tf. Resource names come from the root, and modules never hard-code them.
