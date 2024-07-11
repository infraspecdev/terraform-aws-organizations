variable "permission_sets" {
  type = list(object({
    name             = string
    description      = string
    session_duration = optional(string, "PT1H")
    tags             = optional(map(string), null)
    inline_policy    = optional(string, null)     # Inline policy in JSON format
    managed_policies = optional(list(string), []) # list of ARN's of managed policies
    customer_managed_policies = optional(list(object({
      name = string
      path = optional(string, "/") # list of customer-managed policies with their names and paths to be attached to each.
    })), [])
  }))
  default = []
}

variable "tags" {
  description = "(Optional) Key-value map of resource tags."
  type        = map(string)
  default     = null
}
