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
| [aws_organizations_organizational_unit.org_unit](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [name](#input\_name) | The name for the organizational unit. | `string` | `""` | no |
| [parent\_id](#input\_parent\_id) | ID of the parent organizational unit, which may be the root. | `string` | n/a | yes |
| [tags](#input\_tags) | (Optional) Key-value map of resource tags. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| [aws\_organizations\_organizational\_unit\_accounts](#output\_aws\_organizations\_organizational\_unit\_accounts) | List of child accounts for org\_unit Organizational Unit. |
| [aws\_organizations\_organizational\_unit\_arn](#output\_aws\_organizations\_organizational\_unit\_arn) | ARN of the organizational unit. |
| [aws\_organizations\_organizational\_unit\_id](#output\_aws\_organizations\_organizational\_unit\_id) | Identifier of the organization unit. |
