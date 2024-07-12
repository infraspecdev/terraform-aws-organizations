data "aws_ssoadmin_instances" "sso_instance" {}

locals {
  sso_instance_id = tolist(data.aws_ssoadmin_instances.sso_instance.identity_store_ids)[0]
}

resource "aws_identitystore_group" "this" {
  for_each = var.sso_groups

  identity_store_id = local.sso_instance_id
  display_name      = each.value.group_name
  description       = each.value.group_description
}
