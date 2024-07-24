# Create Organization account

Configuration in this directory creates a organization account within the organization root.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=  1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.51.0 |

## Providers
| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.56.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_billing_access_member_account"></a> [billing\_access\_member\_account](#module\_billing\_access\_member\_account) | ../../modules/account/ | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_organizations_account_arn"></a> [aws\_organizations\_account\_arn](#output\_aws\_organizations\_account\_arn) | The ARN for account. |
| <a name="output_aws_organizations_account_id"></a> [aws\_organizations\_account\_id](#output\_aws\_organizations\_account\_id) | The AWS account id. |
<!-- END_TF_DOCS -->
