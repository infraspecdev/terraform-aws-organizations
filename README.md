# terraform-aws-organizations
A Terraform module to create an aws organization

## Requirements

| Name | Version |
|------|---------|
| [terraform](#requirement\_terraform) | >= 1.4.6 |
| [aws](#requirement\_aws) | >= 4.65.0 |

## Providers

| Name | Version |
|------|---------|
| [aws](#provider\_aws) | >= 4.65.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_organizations_organization.org](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [aws\_service\_access\_principals](#input\_aws\_service\_access\_principals) | (Optional) List of AWS service principal names for which you want to enable integration with your organization. | `list(string)` | `[]` | no |
| [enabled\_policy\_types](#input\_enabled\_policy\_types) | (Optional) List of Organizations policy types to enable in the Organization Root. | `list(string)` | `[]` | no |
| [feature\_set](#input\_feature\_set) | (Optional) Specify "ALL" (default) or "CONSOLIDATED\_BILLING". | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| [aws\_organizations\_organization\_accounts](#output\_aws\_organizations\_organization\_accounts) | List of organization accounts including the master account. |
| [aws\_organizations\_organization\_arn](#output\_aws\_organizations\_organization\_arn) | ARN of the organization. |
| [aws\_organizations\_organization\_id](#output\_aws\_organizations\_organization\_id) | Identifier of the organization. |
| [aws\_organizations\_organization\_master\_account\_arn](#output\_aws\_organizations\_organization\_master\_account\_arn) | ARN of the master account. |
| [aws\_organizations\_organization\_master\_account\_email](#output\_aws\_organizations\_organization\_master\_account\_email) | Email address of the master account. |
| [aws\_organizations\_organization\_master\_account\_id](#output\_aws\_organizations\_organization\_master\_account\_id) | Identifier of the master account. |
| [aws\_organizations\_organization\_none\_master\_accounts](#output\_aws\_organizations\_organization\_none\_master\_accounts) | List of organization accounts excluding the master account. |
| [aws\_organizations\_organization\_roots](#output\_aws\_organizations\_organization\_roots) | List of organization roots. |
