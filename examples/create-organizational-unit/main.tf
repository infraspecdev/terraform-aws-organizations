module "production_ou" {
  source = "../../modules/organizational_unit/"

  name      = local.organizational_unit_name
  parent_id = local.parent_ou_id
}
