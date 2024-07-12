output "sso_group_ids" {
  description = "A map of SSO groups IDs created by this module"
  value       = { for k, v in aws_identitystore_group.this : k => v.group_id }

}
