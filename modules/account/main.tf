data "aws_organizations_organization" "org" {}


resource "aws_organizations_account" "member_account" {
  name                       = var.name
  email                      = var.email
  parent_id                  = var.parent_id != "" ? var.parent_id : data.aws_organizations_organization.org.roots[0].id
  iam_user_access_to_billing = var.iam_user_access_to_billing
  tags                       = var.tags
  close_on_deletion          = var.close_on_deletion
}
