locals {
  aws_region               = "ap-south-1"
  organizational_unit_name = "Production"
  parent_ou_id             = "ou-abcd-abcdefgh"
}

module "production_ou" {
  source = "../../modules/organizational_unit/"

  name      = local.organizational_unit_name
  parent_id = local.parent_ou_id
}
