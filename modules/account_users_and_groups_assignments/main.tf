locals {
  target_type = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_account_assignment" "this" {
  for_each = local.assignment_map

  instance_arn       = local.sso_instance_arn
  permission_set_arn = data.aws_ssoadmin_permission_set.default[each.value.ps_name].arn
  principal_id       = each.value.principal_type == "GROUP" ? data.aws_identitystore_group.default[each.value.principal_name].group_id : data.aws_identitystore_user.default[each.value.principal_name].user_id
  principal_type     = each.value.principal_type
  target_id          = each.value.acc_id
  target_type        = local.target_type
}
