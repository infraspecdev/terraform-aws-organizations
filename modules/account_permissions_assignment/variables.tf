variable "account_assignments" {
  description = <<EOF
  A list of objects representing permission assignments for AWS accounts. Each object contains the following attributes:
  - account_id: The AWS account ID where the permissions will be applied.
  - permission_set_name: The name of the permission set to be used.
  - permission_set_arn: The Amazon Resource Name (ARN) of the permission set.
  - principal_name: An identifier for an object in AWS SSO, such as the name of an SSO group.
  - principal_type: The type of entity for which the assignment will be created. Should be set to 'GROUP' only. Defaults to 'GROUP'."
  EOF
  type = list(object({
    account_id          = string
    permission_set_name = string
    principal_name      = string
    principal_type      = optional(string, "GROUP")
  }))
  default = [{
    account_id          = "471112575944"
    permission_set_name = "Core_Dev"
    principal_name      = "Read_Only"
  }]

  validation {
    condition     = alltrue([for a in var.account_assignments : (a.principal_type == "GROUP")])
    error_message = "Principal type should be 'GROUP' only"
  }
}

variable "identitystore_group_depends_on" {
  description = "A list of parameters to use for data resources to depend on. This is to avoid module depends_on as that will unnecessarily create the module resources"
  type        = list(string)
  default     = []
}

variable "identitystore_permission_set_depends_on" {
  description = "A list of parameters to use for data resources to depend on. This is to avoid module depends_on as that will unnecessarily create the module resources"
  type        = list(string)
  default     = []
}