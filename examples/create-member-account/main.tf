locals {
  aws_region    = "ap-south-1"
  account_name  = ""
  account_email = ""
}

module "billing_access_member_account" {
  source = "../../modules/account/"

  name  = local.account_name
  email = local.account_email
}
