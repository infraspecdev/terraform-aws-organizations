# - Identity Store Group Membership -
resource "aws_identitystore_group_membership" "sso_membership" {
  for_each = local.users_and_their_groups

  identity_store_id = local.sso_instance_id
  group_id          = data.aws_identitystore_group.existing_sso_group[each.key].group_id
  member_id         = data.aws_identitystore_user.existing_sso_user[each.key].user_id
}
