output "permission_sets" {
  description = "A map of the permission sets that were created. Each key is the name of the permission set, and the value contains the ARNs of the created permission sets."
  value       = { for k, v in aws_ssoadmin_permission_set.this : k => v.arn }
}
