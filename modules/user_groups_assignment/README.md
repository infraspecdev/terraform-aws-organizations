# Terraform AWS SSO User and Groups Assignment Module
This Terraform module manages the assignment of AWS SSO groups to users within the organization.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.65.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | ~> 2.5.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.65.0 |
| <a name="provider_local"></a> [local](#provider\_local) | ~> 2.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_identitystore_group_membership.sso_membership](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/identitystore_group_membership) | resource |
| [aws_identitystore_group.existing_sso_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/identitystore_group) | data source |
| [aws_identitystore_user.existing_sso_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/identitystore_user) | data source |
| [aws_ssoadmin_instances.sso_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssoadmin_instances) | data source |
| [local_file.sso_user](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_user_groups_mapping"></a> [user\_groups\_mapping](#input\_user\_groups\_mapping) | Mapping of users to their respective sso groups within the Organisation. For example map of `user@infraspec.dev=[sso_groups]` | `map(list(string))` | `{}` | no |

## Outputs

No outputs.
