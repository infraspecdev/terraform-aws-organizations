# Terraform AWS Account Users and Groups Assignments Module
A Terraform module for assigning users and groups to AWS accounts.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.51.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.2.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.59.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssoadmin_account_assignment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_account_assignment) | resource |
| [null_resource.sso_group_dependency](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.sso_permission_set_dependency](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.sso_user_dependency](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_identitystore_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/identitystore_group) | data source |
| [aws_identitystore_user.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/identitystore_user) | data source |
| [aws_ssoadmin_instances.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssoadmin_instances) | data source |
| [aws_ssoadmin_permission_set.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssoadmin_permission_set) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_assignments"></a> [account\_assignments](#input\_account\_assignments) | A list of objects representing permission assignments for AWS SSO. Each object contains the following attributes:<br>  - account\_id: The AWS account ID where the permissions will be applied.<br>  - permission\_sets: List of permission-set to be assigned to the specified principals.<br>  - principal\_names: An identifier for an object in AWS SSO, such as the names of groups or users .<br>  - principal\_type:The entity type for which the assignment will be created. Valid values: USER, GROUP. | <pre>list(object({<br>    account_id      = string<br>    permission_sets = list(string)<br>    principal_names = list(string)<br>    principal_type  = string<br>  }))</pre> | n/a | yes |
| <a name="input_identitystore_group_depends_on"></a> [identitystore\_group\_depends\_on](#input\_identitystore\_group\_depends\_on) | A list of parameters (For example group IDs)to use for data resources to depend on. This is to avoid module depends\_on as that will unnecessarily create the module resources | `list(string)` | `[]` | no |
| <a name="input_identitystore_permission_set_depends_on"></a> [identitystore\_permission\_set\_depends\_on](#input\_identitystore\_permission\_set\_depends\_on) | A list of parameters (For example permission set ARNs)to use for data resources to depend on. This is to avoid module depends\_on as that will unnecessarily create the module resources | `list(string)` | `[]` | no |
| <a name="input_identitystore_user_depends_on"></a> [identitystore\_user\_depends\_on](#input\_identitystore\_user\_depends\_on) | A list of parameters (For example user IDs)to use for data resources to depend on. This is to avoid module depends\_on as that will unnecessarily create the module resources | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_assignments"></a> [assignments](#output\_assignments) | The account assignment resources created for AWS SSO. Each resource includes details about the account, permission set, principal, and the status of the assignments. |
