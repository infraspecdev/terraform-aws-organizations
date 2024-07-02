module "service_integration_enabled_org" {
  source = "../../"

  aws_service_access_principals = local.aws_organizations_aws_service_access_principals
  aws_enabled_policy_types      = local.aws_organizations_enabled_policy_types
  aws_feature_set               = local.aws_organizations_feature_set
}
