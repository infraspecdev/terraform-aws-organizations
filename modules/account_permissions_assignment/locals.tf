
locals {
  assignment_map = {
    for a in var.account_assignments :
    format("%v-%v-%v-%v", a.account_id, substr(a.principal_type, 0, 1), a.principal_name, a.permission_set_name) => a
  }

  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
  sso_instance_arn  = tolist(data.aws_ssoadmin_instances.this.arns)[0]

  group_list          = toset([for mapping in var.account_assignments : mapping.principal_name])
  permission_set_list = toset([for mapping in var.account_assignments : mapping.permission_set_name])

}

