variable "account_assignments" {
  description = <<EOF
  A list of objects representing permission assignments for AWS SSO. Each object contains the following attributes:
  - account_id: The AWS account ID where the permissions will be applied.
  - permission_sets: List of permission-set names to be assigned.
  - principal_name: An identifier for an object in AWS SSO, such as the name of an SSO group.
    EOF
  type = list(object({
    account_id      = string
    permission_sets = list(string)
    principal_name  = string
  }))
  default = []

  validation {
    condition     = alltrue([for a in var.account_assignments : can(regex("^\\d{12}$", a.account_id))])
    error_message = "Principal type should be 'GROUP' only"
  }
  validation {
    condition     = alltrue([for a in var.account_assignments : length(a.permission_sets) > 0])
    error_message = "Permission sets cannot be empty."
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
