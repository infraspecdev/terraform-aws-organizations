locals {
  sso_instance_arn    = tolist(data.aws_ssoadmin_instances.default.arns)[0]
  permission_set_map  = { for ps_name, ps in var.permission_sets : ps_name => ps }
  inline_policies_map = { for ps_name, ps in var.permission_sets : ps_name => ps.inline_policy if ps.inline_policy != "" }
  managed_policy_map  = { for ps_name, ps in var.permission_sets : ps_name => ps.managed_policies if length(ps.managed_policies) > 0 }
  managed_policy_attachments = flatten([
    for ps_name, policy_list in local.managed_policy_map : [
      for policy_arn in policy_list : {
        ps_name    = ps_name
        policy_arn = policy_arn
      }
    ]
  ])
  managed_policy_attachments_map = {
    for policy in local.managed_policy_attachments : "${policy.ps_name}.${policy.policy_arn}" => policy
  }
  customer_managed_policy_map = { for ps_name, ps in var.permission_sets : ps_name => ps.customer_managed_policies if length(ps.customer_managed_policies) > 0 }
  customer_managed_policy_attachments = flatten([
    for ps_name, policy_list in local.customer_managed_policy_map : [
      for policy in policy_list : {
        ps_name     = ps_name
        policy_name = policy.name
        policy_path = policy.path
      }
    ]
  ])
  customer_managed_policy_attachments_map = {
    for policy in local.customer_managed_policy_attachments : "${policy.ps_name}.${policy.policy_path}${policy.policy_name}" => policy
  }
}
