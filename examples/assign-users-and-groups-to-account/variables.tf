variable "account_assignments" {
  description = <<EOF
  A list of objects representing permission assignments for AWS SSO. Each object contains the following attributes:
  - account_id: The AWS account ID where the permissions will be applied.
  - permission_sets: List of permission-set to be assigned to the specified principals.
  - principal_names: An identifier for an object in AWS SSO, such as the names of groups or users .
   -principal_type: The entity type for which the assignment will be created. Valid values: USER, GROUP.
    EOF
  type = list(object({
    account_id      = string
    permission_sets = list(string)
    principal_names = list(string)
    principal_type  = string
  }))
  default = [
    {
      account_id      = "121212121212"
      permission_sets = ["StagingDev"]
      principal_names = ["Staging_Dev"]
      principal_type  = "GROUP"
    },
  ]
}
