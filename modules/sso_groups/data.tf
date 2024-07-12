# Fetch existing SSO Instance
data "aws_ssoadmin_instances" "default" {}

# - Fetch of SSO Users to be used for group membership assignment -
data "aws_identitystore_user" "default" {
  for_each = local.users_and_their_groups

  identity_store_id = local.sso_instance_id

  alternate_identifier {
    # Filter users by user_name (nuzumaki, suchiha, dovis, etc.)
    unique_attribute {
      attribute_path  = "UserName"
      attribute_value = each.value.user_name
    }
  }
}

