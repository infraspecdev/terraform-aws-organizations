
locals {

  account_map = {
    for account in data.aws_organizations_organization.o.accounts : account.name => account.id
  }

  target_type = "AWS_ACCOUNT"
  flatten_account_group_permission = flatten([
    for acc_assignment in var.account_assignments : [
      for ps_name in acc_assignment.permission_sets : [
        for pr_name in acc_assignment.principal_names : {
          acc_id         = account_map[acc_assignment.account_name]
          principal_name = pr_name
          ps_name        = ps_name
          principal_type = acc_assignment.principal_type
        }
      ]
    ]
  ])
  assignment_map = {
    for a in local.flatten_account_group_permission :
    format("%v-%v-%v-%v", a.acc_id, substr(a.principal_type, 0, 1), a.principal_name, a.ps_name) => a
  }

  identity_store_id = tolist(data.aws_ssoadmin_instances.default.identity_store_ids)[0]
  sso_instance_arn  = tolist(data.aws_ssoadmin_instances.default.arns)[0]

  group_list = toset(flatten([for a in var.account_assignments : [
    for pr_name in a.principal_names : [
    pr_name] if a.principal_type == "GROUP"
    ]
  ]))

  user_list = toset(flatten([for a in var.account_assignments : [
    for pr_name in a.principal_names : [
    pr_name] if a.principal_type == "USER"
    ]
  ]))

  permission_set_list = toset(flatten([for a in var.account_assignments : [
    [for ps_name in a.permission_sets : ps_name
    ]
    ]
  ]))
  # permission_set_list = toset(local.all_permission_sets)
}
