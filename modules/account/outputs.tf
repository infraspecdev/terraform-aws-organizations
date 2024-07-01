output "aws_organizations_account_arn" {
  description = "The ARN for this account."
  value       = aws_organizations_account.member_account.arn
}

output "aws_organizations_account_id" {
  description = "The AWS account id."
  value       = aws_organizations_account.member_account.id
}
