resource "null_resource" "sso_group_dependency" {
  triggers = {
    dependency_id = join(",", var.identitystore_group_depends_on)
  }
}

data "aws_identitystore_group" "this" {
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

data "aws_ssoadmin_instances" "this" {

}

resource "null_resource" "sso_permission_set_dependency" {
  triggers = {
    dependency_id = join(",", var.identitystore_permission_set_depends_on)
  }
}

data "aws_ssoadmin_permission_set" "this" {
  for_each = local.permission_set_list

  instance_arn = local.sso_instance_arn
  name         = each.value
  depends_on   = [null_resource.sso_permission_set_dependency]
}



