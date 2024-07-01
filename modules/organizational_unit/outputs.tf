output "aws_organizations_organizational_unit_accounts" {
  description = "List of child accounts for org_unit Organizational Unit."
  value       = aws_organizations_organizational_unit.org_unit.accounts
}

output "aws_organizations_organizational_unit_arn" {
  description = "ARN of the organizational unit."
  value       = aws_organizations_organizational_unit.org_unit.arn
}

output "aws_organizations_organizational_unit_id" {
  description = "Identifier of the organization unit."
  value       = aws_organizations_organizational_unit.org_unit.id
}
