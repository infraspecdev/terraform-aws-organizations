<!-- BEGIN_TF_DOCS -->
# Terraform AWS Organizations SSO Groups module
A Terraform module for creating sso groups and attaching users to the groups within the organisation.

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
| [aws_identitystore_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/identitystore_group) | resource |
| [aws_identitystore_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/identitystore_group_membership) | resource |
| [aws_identitystore_user.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/identitystore_user) | data source |
| [aws_ssoadmin_instances.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssoadmin_instances) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sso_groups"></a> [sso\_groups](#input\_sso\_groups) | A map of objects defining AWS SSO groups to be created. Each object contains:<br>  - group\_name: The name of the SSO group.<br>  - group\_description: A description for the SSO group. | <pre>map(object(<br>    {<br>      group_name        = string<br>      group_description = string<br>    }<br>  ))</pre> | n/a | yes |
| <a name="input_user_groups_map"></a> [user\_groups\_map](#input\_user\_groups\_map) | Mapping of users to their respective sso groups within the Organisation. For example map of `user=[sso_groups]` | `map(list(string))` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sso_group_ids"></a> [sso\_group\_ids](#output\_sso\_group\_ids) | A map of SSO groups IDs created by this module |
<!-- END_TF_DOCS -->