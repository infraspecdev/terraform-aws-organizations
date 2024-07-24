output "aws_organizations_organization_accounts" {
  description = "List of organization accounts including the master account."
  value       = module.service_integration_enabled_org.aws_organizations_organization_accounts
}

output "aws_organizations_organization_arn" {
  description = "ARN of the organization."
  value       = module.service_integration_enabled_org.aws_organizations_organization_arn
}

output "aws_organizations_organization_id" {
  description = "Identifier of the organization."
  value       = module.service_integration_enabled_org.aws_organizations_organization_id
}

output "aws_organizations_organization_master_account_arn" {
  description = "ARN of the master account."
  value       = module.service_integration_enabled_org.aws_organizations_organization_master_account_arn
}

output "aws_organizations_organization_master_account_email" {
  description = "Email address of the master account."
  value       = module.service_integration_enabled_org.aws_organizations_organization_master_account_email
}

output "aws_organizations_organization_master_account_id" {
  description = "Identifier of the master account."
  value       = module.service_integration_enabled_org.aws_organizations_organization_master_account_id
}

output "aws_organizations_organization_none_master_accounts" {
  description = "List of organization accounts excluding the master account."
  value       = module.service_integration_enabled_org.aws_organizations_organization_none_master_accounts
}

output "aws_organizations_organization_roots" {
  description = "List of organization roots."
  value       = module.service_integration_enabled_org.aws_organizations_organization_roots
}
