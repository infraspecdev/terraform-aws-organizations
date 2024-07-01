resource "aws_organizations_account" "member_account" {
  name                       = var.name
  email                      = var.email
  parent_id                  = var.parent_id
  iam_user_access_to_billing = var.iam_user_access_to_billing
  tags                       = var.tags
}
