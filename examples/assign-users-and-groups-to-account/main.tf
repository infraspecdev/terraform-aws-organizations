locals {
  aws_region = "us-east-1"
}

module "account_perimissions_assignment" {
  source = "../../modules/account_users_and_groups_assignments"

  account_assignments = var.account_assignments
}
