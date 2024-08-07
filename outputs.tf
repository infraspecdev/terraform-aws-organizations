output "aws_organizations_organization_accounts" {
  description = "List of organization accounts including the master account."
  value       = aws_organizations_organization.org.accounts
}

output "aws_organizations_organization_arn" {
  description = "ARN of the organization."
  value       = aws_organizations_organization.org.arn
}

output "aws_organizations_organization_id" {
  description = "Identifier of the organization."
  value       = aws_organizations_organization.org.id
}

output "aws_organizations_organization_master_account_arn" {
  description = "ARN of the master account."
  value       = aws_organizations_organization.org.master_account_arn
}

output "aws_organizations_organization_master_account_email" {
  description = "Email address of the master account."
  value       = aws_organizations_organization.org.master_account_email
}

output "aws_organizations_organization_master_account_id" {
  description = "Identifier of the master account."
  value       = aws_organizations_organization.org.master_account_id
}

output "aws_organizations_organization_none_master_accounts" {
  description = "List of organization accounts excluding the master account."
  value       = aws_organizations_organization.org.non_master_accounts
}

output "aws_organizations_organization_roots" {
  description = "List of organization roots."
  value       = aws_organizations_organization.org.roots
}
