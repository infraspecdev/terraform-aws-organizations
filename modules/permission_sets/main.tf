locals {
  sso_instance_arn    = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  permission_set_map  = { for ps in var.permission_sets : ps.name => ps }
  inline_policies_map = { for ps in var.permission_sets : ps.name => ps.inline_policy if ps.inline_policy != null }
  managed_policy_map  = { for ps in var.permission_sets : ps.name => ps.managed_policies if length(ps.managed_policies) > 0 }
  managed_policy_attachments = flatten([
    for ps_name, policy_list in local.managed_policy_map : [
      for policy_arn in policy_list : {
        permission_set = ps_name
        policy_arn     = policy_arn
      }
    ]
  ])
  managed_policy_attachments_map = {
    for policy in local.managed_policy_attachments : "${policy.permission_set}.${policy.policy_arn}" => policy
  }
  customer_managed_policy_map = { for ps in var.permission_sets : ps.name => ps.customer_managed_policies if length(ps.customer_managed_policies) > 0 }
  customer_managed_policy_attachments = flatten([
    for ps_name, policy_list in local.customer_managed_policy_map : [
      for policy in policy_list : {
        permission_set = ps_name
        policy_name    = policy.name
        policy_path    = policy.path
      }
    ]
  ])
  customer_managed_policy_attachments_map = {
    for policy in local.customer_managed_policy_attachments : "${policy.permission_set}.${policy.policy_path}${policy.policy_name}" => policy
  }
}

data "aws_ssoadmin_instances" "this" {}

# CREATE THE PERMISSION SETS
resource "aws_ssoadmin_permission_set" "this" {
  for_each = local.permission_set_map

  name             = each.key
  description      = each.value.description
  instance_arn     = local.sso_instance_arn
  session_duration = each.value.session_duration
  tags             = merge(each.value.tags, var.tags)
}

# ATTACH INLINE POLICIES
resource "aws_ssoadmin_permission_set_inline_policy" "this" {
  for_each = local.inline_policies_map

  inline_policy      = each.value
  instance_arn       = local.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.this[each.key].arn
  depends_on         = [aws_ssoadmin_permission_set_inline_policy.this]
}

# ATTACH MANAGED POLICIES
resource "aws_ssoadmin_managed_policy_attachment" "this" {
  for_each = local.managed_policy_attachments_map

  instance_arn       = local.sso_instance_arn
  managed_policy_arn = each.value.policy_arn
  permission_set_arn = aws_ssoadmin_permission_set.this[each.value.policy_set].arn
  depends_on         = [aws_ssoadmin_permission_set_inline_policy.this]
}

# ATTACH CUSTOMER MANAGED POLICIES
resource "aws_ssoadmin_customer_managed_policy_attachment" "this" {
  for_each           = local.customer_managed_policy_attachments_map
  instance_arn       = local.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.this[each.value.policy_set].arn
  customer_managed_policy_reference {
    name = each.value.policy_name
    path = each.value.policy_path
  }
  depends_on = [aws_ssoadmin_permission_set_inline_policy.this]
}

