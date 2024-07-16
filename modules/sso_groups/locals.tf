# - Users and Groups
locals {
  # Create a new local variable by flattening the complex type given in the variable "sso_users"
  flatten_user_data = flatten([
    for this_user in keys(var.user_groups_map) : [
      for group in var.user_groups_map[this_user] : {
        user_name  = this_user
        group_name = group
      }
    ]
  ])

  users_and_their_groups = {
    for s in local.flatten_user_data : format("%s_%s", s.user_name, s.group_name) => s
  }

  # - Fetch SSO Instance ARN and SSO Instance ID -
  sso_instance_id = tolist(data.aws_ssoadmin_instances.default.identity_store_ids)[0]
}
