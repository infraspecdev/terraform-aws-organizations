locals {
  aws_region = "us-east-1"
}

module "sso_groups" {
  source = "../../modules/sso_groups/"

  sso_groups      = var.sso_groups
  user_groups_map = var.user_groups_map
}
