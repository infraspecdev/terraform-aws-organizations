locals {
  aws_region                                      = "ap-south-1"
  aws_organizations_feature_set                   = "ALL"
  aws_organizations_enabled_policy_types          = []
  aws_organizations_aws_service_access_principals = []
}

module "service_integration_enabled_org" {
  source = "../../"

  service_access_principals = local.aws_organizations_aws_service_access_principals
  enabled_policy_types      = local.aws_organizations_enabled_policy_types
  feature_set               = local.aws_organizations_feature_set
}
