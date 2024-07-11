
locals {
  flatten_account_group_permission = flatten([
    for acc_assignment in var.account_assignments : [
      for ps_name in acc_assignment.permission_sets : {
        acc_id         = acc_assignment.account_id
        principal_name = acc_assignment.principal_name
        ps_name        = ps_name
      }
    ]
  ])
  assignment_map = {
    for a in local.flatten_account_group_permission :
    format("%v-%v-%v", a.acc_id, a.principal_name, a.ps_name) => a
  }

  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
  sso_instance_arn  = tolist(data.aws_ssoadmin_instances.this.arns)[0]

  group_list = toset([for mapping in var.account_assignments : mapping.principal_name])
  all_permission_sets = flatten([for mapping in var.account_assignments : [
    [for ps_name in mapping.permission_sets : ps_name
    ]
    ]
  ])
  permission_set_list = toset(local.all_permission_sets)
}
