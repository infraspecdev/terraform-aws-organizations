# Create Organization

Configuration in this directory creates a organization in the aws account with ALL feature set.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which may cost money. Run `terraform destroy` when you don't need these resources.


<!-- BEGIN_TF_DOCS -->
    ## Usage

  To run this example you need to execute:

  ```bash
  $ terraform init
  $ terraform plan
  $ terraform apply
  ```

  Note that this example may create resources which may cost money. Run `terraform destroy` when you don't need these resources.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=  1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.51.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_service_integration_enabled_org"></a> [service\_integration\_enabled\_org](#module\_service\_integration\_enabled\_org) | ../../ | n/a |

## Resources

No resources.

## Inputs

No inputs.

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
<!-- END_TF_DOCS -->
