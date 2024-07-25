locals {
  aws_region = "us-east-1"
}

module "permission_sets" {
  source = "../../modules/permission_sets"

  permission_sets = var.permission_sets
}
