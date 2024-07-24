output "aws_organizations_account_arn" {
  description = "The ARN for account."
  value       = module.billing_access_member_account.aws_organizations_account_arn
}

output "aws_organizations_account_id" {
  description = "The AWS account id."
  value       = module.billing_access_member_account.aws_organizations_account_id
}
