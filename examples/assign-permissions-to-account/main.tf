module "account_perimissions_assignment" {
  source = "../../modules/account_permissions_assignment"

  account_assignments = var.account_assignments
}
