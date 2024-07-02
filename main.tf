resource "aws_organizations_organization" "org" {
  aws_service_access_principals = var.aws_service_access_principals
  enabled_policy_types          = var.aws_enabled_policy_types
  feature_set                   = var.aws_feature_set
}
