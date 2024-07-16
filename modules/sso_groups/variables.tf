variable "sso_groups" {
  description = <<EOF
  A map of objects defining AWS SSO groups to be created. Each object contains:
  - group_name: The name of the SSO group.
  - group_description: A description for the SSO group.
  EOF
  type = map(object(
    {
      group_name        = string
      group_description = string
    }
  ))
}

variable "user_groups_map" {
  type        = map(list(string))
  description = "Mapping of users to their respective sso groups within the Organisation. For example map of `user=[sso_groups]"
  default     = {}

  validation {
    condition = alltrue([
      for groups in var.user_groups_map : (
        length(groups) > 0
      )
    ])
    error_message = "Each value must be a non-empty list of SSO groups."
  }
}
