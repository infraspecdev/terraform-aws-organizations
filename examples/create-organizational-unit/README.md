# Create Organization

Configuration in this directory creates a organizational unit  named production with the pareant ou id

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.56.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_production_ou"></a> [production\_ou](#module\_production\_ou) | ../../modules/organizational_unit/ | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_organizations_organizational_unit_accounts"></a> [aws\_organizations\_organizational\_unit\_accounts](#output\_aws\_organizations\_organizational\_unit\_accounts) | List of child accounts for org\_unit Organizational Unit. |
| <a name="output_aws_organizations_organizational_unit_arn"></a> [aws\_organizations\_organizational\_unit\_arn](#output\_aws\_organizations\_organizational\_unit\_arn) | ARN of the organizational unit. |
| <a name="output_aws_organizations_organizational_unit_id"></a> [aws\_organizations\_organizational\_unit\_id](#output\_aws\_organizations\_organizational\_unit\_id) | Identifier of the organization unit. |
<!-- END_TF_DOCS -->
