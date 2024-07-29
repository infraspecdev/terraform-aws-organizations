data "aws_organizations_organization" "o" {}

resource "null_resource" "sso_group_dependency" {
  triggers = {
    dependency_id = join(",", var.identitystore_group_depends_on)
  }
}

resource "null_resource" "sso_user_dependency" {
  triggers = {
    dependency_id = join(",", var.identitystore_user_depends_on)
  }
}

data "aws_identitystore_group" "default" {
  for_each = local.group_list

  identity_store_id = local.identity_store_id

  alternate_identifier {
    unique_attribute {
      attribute_path  = "DisplayName"
      attribute_value = each.key
    }
  }

  depends_on = [null_resource.sso_group_dependency]
}

data "aws_identitystore_user" "default" {
  for_each = local.user_list

  identity_store_id = local.identity_store_id

  alternate_identifier {
    unique_attribute {
      attribute_path  = "UserName"
      attribute_value = each.key
    }
  }

  depends_on = [null_resource.sso_user_dependency]
}

data "aws_ssoadmin_instances" "default" {

}

resource "null_resource" "sso_permission_set_dependency" {
  triggers = {
    dependency_id = join(",", var.identitystore_permission_set_depends_on)
  }
}

data "aws_ssoadmin_permission_set" "default" {
  for_each = local.permission_set_list

  instance_arn = local.sso_instance_arn
  name         = each.value
  depends_on   = [null_resource.sso_permission_set_dependency]
}
