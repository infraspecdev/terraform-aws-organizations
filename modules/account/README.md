## Requirements

| Name | Version |
|------|---------|
| [terraform](#requirement\_terraform) | >= 1.4.6 |
| [aws](#requirement\_aws) | >= 4.65.0 |

## Providers

| Name | Version |
|------|---------|
| [aws](#provider\_aws) | 5.56.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_organizations_account.member_account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [email](#input\_email) | (Required) Email address of the owner to assign to the new member account. | `string` | n/a | yes |
| [iam\_user\_access\_to\_billing](#input\_iam\_user\_access\_to\_billing) | (Optional) If set to ALLOW, the new account enables IAM users and roles to access account billing information if they have the required permissions. | `string` | `"ALLOW"` | no |
| [name](#input\_name) | (Required) Friendly name for the member account. | `string` | n/a | yes |
| [parent\_id](#input\_parent\_id) | (Optional) Parent Organizational Unit ID or Root ID for the account. | `string` | `null` | no |
| [tags](#input\_tags) | (Optional) Key-value map of resource tags. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| [aws\_organizations\_account\_arn](#output\_aws\_organizations\_account\_arn) | The ARN for this account. |
| [aws\_organizations\_account\_id](#output\_aws\_organizations\_account\_id) | The AWS account id. |