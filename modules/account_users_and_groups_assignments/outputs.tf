output "assignments" {
  description = "The account assignment resources created for AWS SSO. Each resource includes details about the account, permission set, principal, and the status of the assignments."
  value       = aws_ssoadmin_account_assignment.this
}
