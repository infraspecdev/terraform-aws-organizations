locals {
  target_type    = "AWS_ACCOUNT"
  principal_type = "GROUP"
}

resource "aws_ssoadmin_account_assignment" "this" {
  for_each = local.assignment_map

  instance_arn       = local.sso_instance_arn
  permission_set_arn = data.aws_ssoadmin_permission_set.this[each.value.ps_name].arn
  principal_id       = data.aws_identitystore_group.this[each.value.principal_name].group_id
  principal_type     = local.principal_type
  target_id          = each.value.acc_id
  target_type        = local.target_type
}
