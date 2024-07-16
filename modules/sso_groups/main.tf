resource "aws_identitystore_group" "this" {
  for_each = var.sso_groups

  identity_store_id = local.sso_instance_id
  display_name      = each.value.group_name
  description       = each.value.group_description
}

resource "aws_identitystore_group_membership" "this" {
  for_each = local.users_and_their_groups

  identity_store_id = local.sso_instance_id
  group_id          = aws_identitystore_group.this[each.value.group_name].group_id
  member_id         = data.aws_identitystore_user.default[each.key].user_id
}
