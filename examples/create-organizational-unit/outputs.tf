output "aws_organizations_organizational_unit_accounts" {
  description = "List of child accounts for org_unit Organizational Unit."
  value       = module.production_ou.aws_organizations_organizational_unit_accounts
}

output "aws_organizations_organizational_unit_arn" {
  description = "ARN of the organizational unit."
  value       = module.production_ou.aws_organizations_organizational_unit_arn
}

output "aws_organizations_organizational_unit_id" {
  description = "Identifier of the organization unit."
  value       = module.production_ou.aws_organizations_organizational_unit_id
}
