<!-- BEGIN_TF_DOCS -->
  ## Usage

  To run this example you need to execute:

  ```bash
  $ terraform init
  $ terraform plan
  $ terraform apply
  ```

  Note that this example may create resources which may cost money. Run `terraform destroy` when you don't need these resources.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.51.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_permission_sets"></a> [permission\_sets](#module\_permission\_sets) | ../../modules/permission_sets | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_permission_sets"></a> [permission\_sets](#input\_permission\_sets) | (Required)A map of permission set objects with key as the permission set name. Each object contains:<br>  - name: The name of the permission set.<br>  - description: A brief description of the permission set.<br>  - session\_duration: Optional session duration for the permission set (default is null).<br>  - relay\_state: Optional relay state for the permission set (default is null).<br>  - tags: Optional map of tags to associate with the permission set.<br>  - inline\_policy: The inline policy content in JSON format.<br>  - managed\_policies: A list of ARNs of managed policies to attach to the permission set.<br>  - customer\_managed\_policies: A list of customer-managed policies to attach to the permission set. Each policy includes:<br>      - name: The name of the customer-managed policy.<br>      - path: The path of the customer-managed policy (default is "/"). | <pre>map(object({<br>    name             = string<br>    description      = string<br>    session_duration = optional(string, null)<br>    relay_state      = optional(string, null)<br>    tags             = optional(map(string))<br>    inline_policy    = string<br>    managed_policies = list(string)<br>    customer_managed_policies = list(object({<br>      name = string<br>      path = optional(string, "/")<br>    }))<br>  }))</pre> | <pre>{<br>  "AdministratorAccess": {<br>    "customer_managed_policies": [],<br>    "description": "Allow Full Access to the account",<br>    "inline_policy": "",<br>    "managed_policies": [<br>      "arn:aws:iam::aws:policy/AdministratorAccess"<br>    ],<br>    "name": "AdministratorAccess",<br>    "relay_state": "",<br>    "session_duration": "PT12H",<br>    "tags": {}<br>  }<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
