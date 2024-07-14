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
}
variable "identitystore_group_depends_on" {
  description = "A list of parameters (For example group IDs)to use for data resources to depend on. This is to avoid module depends_on as that will unnecessarily create the module resources"
  type        = list(string)
  default     = []
}

variable "identitystore_user_depends_on" {
  description = "A list of parameters (For example user IDs)to use for data resources to depend on. This is to avoid module depends_on as that will unnecessarily create the module resources"
  type        = list(string)
  default     = []
}

variable "identitystore_permission_set_depends_on" {
  description = "A list of parameters (For example permission set ARNs)to use for data resources to depend on. This is to avoid module depends_on as that will unnecessarily create the module resources"
  type        = list(string)
  default     = []
}
