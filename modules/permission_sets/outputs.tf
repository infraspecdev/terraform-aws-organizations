output "permission_sets" {
  description = "A map of the permission sets that were created. Each key is the name of the permission set, and the value contains the details of the created permission set."
  value       = aws_ssoadmin_permission_set.this
}
