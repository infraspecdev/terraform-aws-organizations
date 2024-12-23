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
| <a name="module_account_perimissions_assignment"></a> [account\_perimissions\_assignment](#module\_account\_perimissions\_assignment) | ../../modules/account_users_and_groups_assignments | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_assignments"></a> [account\_assignments](#input\_account\_assignments) | A list of objects representing permission assignments for AWS SSO. Each object contains the following attributes:<br/>  - account\_name: The AWS account where the permissions will be applied.<br/>  - permission\_sets: List of permission-set to be assigned to the specified principals.<br/>  - principal\_names: An identifier for an object in AWS SSO, such as the names of groups or users .<br/>   -principal\_type: The entity type for which the assignment will be created. Valid values: USER, GROUP. | <pre>list(object({<br/>    account_name    = string<br/>    permission_sets = list(string)<br/>    principal_names = list(string)<br/>    principal_type  = string<br/>  }))</pre> | <pre>[<br/>  {<br/>    "account_name": "staging",<br/>    "permission_sets": [<br/>      "StagingDev"<br/>    ],<br/>    "principal_names": [<br/>      "Staging_Dev"<br/>    ],<br/>    "principal_type": "GROUP"<br/>  }<br/>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
