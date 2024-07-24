# Terraform AWS Organizations Module
A Terraform module for creating and managing AWS Organizations.

## Available Features

- Organization Creation: Set up AWS Organizations.
- Account Management: Create and manage member accounts.
- Organizational Units: Establish and manage organizational units.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=  1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.59.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_organizations_organization.org](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enabled_policy_types"></a> [enabled\_policy\_types](#input\_enabled\_policy\_types) | (Optional) List of Organizations policy types to enable in the Organization Root. | `list(string)` | `[]` | no |
| <a name="input_feature_set"></a> [feature\_set](#input\_feature\_set) | (Optional) Specify "ALL" (default) or "CONSOLIDATED\_BILLING". | `string` | n/a | yes |
| <a name="input_service_access_principals"></a> [service\_access\_principals](#input\_service\_access\_principals) | (Optional) List of AWS service principal names for which you want to enable integration with your organization. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_organizations_organization_accounts"></a> [aws\_organizations\_organization\_accounts](#output\_aws\_organizations\_organization\_accounts) | List of organization accounts including the master account. |
| <a name="output_aws_organizations_organization_arn"></a> [aws\_organizations\_organization\_arn](#output\_aws\_organizations\_organization\_arn) | ARN of the organization. |
| <a name="output_aws_organizations_organization_id"></a> [aws\_organizations\_organization\_id](#output\_aws\_organizations\_organization\_id) | Identifier of the organization. |
| <a name="output_aws_organizations_organization_master_account_arn"></a> [aws\_organizations\_organization\_master\_account\_arn](#output\_aws\_organizations\_organization\_master\_account\_arn) | ARN of the master account. |
| <a name="output_aws_organizations_organization_master_account_email"></a> [aws\_organizations\_organization\_master\_account\_email](#output\_aws\_organizations\_organization\_master\_account\_email) | Email address of the master account. |
| <a name="output_aws_organizations_organization_master_account_id"></a> [aws\_organizations\_organization\_master\_account\_id](#output\_aws\_organizations\_organization\_master\_account\_id) | Identifier of the master account. |
| <a name="output_aws_organizations_organization_none_master_accounts"></a> [aws\_organizations\_organization\_none\_master\_accounts](#output\_aws\_organizations\_organization\_none\_master\_accounts) | List of organization accounts excluding the master account. |
| <a name="output_aws_organizations_organization_roots"></a> [aws\_organizations\_organization\_roots](#output\_aws\_organizations\_organization\_roots) | List of organization roots. |
