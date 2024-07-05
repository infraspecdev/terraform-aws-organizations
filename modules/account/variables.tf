variable "name" {
  description = "(Required) Friendly name for the member account."
  type        = string
}

variable "email" {
  description = "(Required) Email address of the owner to assign to the new member account."
  type        = string
}

variable "parent_id" {
  description = "(Optional) Parent Organizational Unit ID or Root ID for the account."
  type        = string
  default     = null
}

variable "iam_user_access_to_billing" {
  description = "(Optional) If set to ALLOW, the new account enables IAM users and roles to access account billing information if they have the required permissions."
  type        = string
  default     = "ALLOW"

  validation {
    condition     = contains(["ALLOW", "DENY"], var.iam_user_access_to_billing)
    error_message = "Allowed values for iam_user_access_to_billing: ALLOW or DENY"
  }
}

variable "close_on_deletion" {
  description = "(Optional) If true, a deletion event will close the account. Otherwise, it will only remove from the organization."
  type        = bool
  default     = true

  validation {
    condition     = contains([true, false], var.close_on_deletion)
    error_message = "Allowed values for close_on_deletion: true or false"
  }
}

variable "tags" {
  description = "(Optional) Key-value map of resource tags."
  type        = map(string)
  default     = {}
}
