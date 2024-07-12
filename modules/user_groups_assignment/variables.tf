variable "user_groups_mapping" {
  type        = map(list(string))
  description = "Mapping of users to their respective sso groups within the Organisation. For example map of `user@infraspec.dev=[sso_groups]"
  default     = {}
  validation {
    condition = alltrue([
      for user, groups in var.user_groups_mapping : (
        can(regex("^[a-zA-Z0-9+]+@infraspec\\.dev$", user)) &&
        length(groups) > 0 &&
        alltrue([for group in groups : can(regex("^[A-Za-z0-9_]+$", group))])
      )
    ])
    error_message = "Each key must be a valid email address with the domain 'infraspec.dev', and each value must be a non-empty list of SSO group names."
  }
}
