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
| <a name="module_sso_groups"></a> [sso\_groups](#module\_sso\_groups) | ../../modules/sso_groups/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sso_groups"></a> [sso\_groups](#input\_sso\_groups) | (Recquired)A map of objects defining AWS SSO groups to be created. Each object contains:<br>  - group\_name: The name of the SSO group.<br>  - group\_description: A description for the SSO group. | <pre>map(object(<br>    {<br>      group_name        = string<br>      group_description = string<br>    }<br>  ))</pre> | <pre>{<br>  "Org_Staging_Dev": {<br>    "group_description": "Developer access to org staging account",<br>    "group_name": "Org_Staging_Dev"<br>  }<br>}</pre> | no |
| <a name="input_user_groups_map"></a> [user\_groups\_map](#input\_user\_groups\_map) | (Optional)Mapping of users to their respective sso groups within the Organisation. For example map of `user=[sso_groups]` | `map(list(string))` | <pre>{<br>  "employee@org.com": [<br>    "Org_Staging_Dev"<br>  ]<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
