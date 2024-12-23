<!-- BEGIN_TF_DOCS -->
# Terraform AWS Organizations Permission-Sets Module
A Terraform module for creating and managing AWS SSO (Single Sign-On) Permission Sets within AWS Organizations

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.59.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.59.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssoadmin_customer_managed_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_customer_managed_policy_attachment) | resource |
| [aws_ssoadmin_managed_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_managed_policy_attachment) | resource |
| [aws_ssoadmin_permission_set.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_permission_set) | resource |
| [aws_ssoadmin_permission_set_inline_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_permission_set_inline_policy) | resource |
| [aws_ssoadmin_instances.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssoadmin_instances) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_permission_sets"></a> [permission\_sets](#input\_permission\_sets) | (Required)A map of permission set objects with permission set name as the key. Each object contains:<br/>  - name: The name of the permission set.<br/>  - description: A brief description of the permission set.<br/>  - session\_duration: Optional session duration for the permission set (default is PT1H).<br/>  - relay\_state: Optional relay state for the permission set (default is null).<br/>  - tags: Optional map of tags to associate with the permission set.<br/>  - inline\_policy: The inline policy content in JSON format.<br/>  - managed\_policies: A list of ARNs of managed policies to attach to the permission set.<br/>  - customer\_managed\_policies: A list of customer-managed policies to attach to the permission set. Each policy includes:<br/>      - name: The name of the customer-managed policy.<br/>      - path: The path of the customer-managed policy (default is "/"). | <pre>map(object({<br/>    name             = string<br/>    description      = string<br/>    session_duration = optional(string, null)<br/>    relay_state      = optional(string, null)<br/>    tags             = optional(map(string))<br/>    inline_policy    = string<br/>    managed_policies = list(string)<br/>    customer_managed_policies = list(object({<br/>      name = string<br/>      path = optional(string, "/")<br/>    }))<br/>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Key-value map of resource tags. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_permission_sets_arns"></a> [permission\_sets\_arns](#output\_permission\_sets\_arns) | A map of the permission sets that were created. Each key is the name of the permission set, and the value contains the ARNs of the created permission sets. |
<!-- END_TF_DOCS -->\n
