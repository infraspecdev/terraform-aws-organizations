variable "permission_sets" {
  description = <<EOF
  (Required)A map of permission set objects with permission set name as the key. Each object contains:
  - name: The name of the permission set.
  - description: A brief description of the permission set.
  - session_duration: Optional session duration for the permission set (default is PT1H).
  - relay_state: Optional relay state for the permission set (default is null).
  - tags: Optional map of tags to associate with the permission set.
  - inline_policy: The inline policy content in JSON format.
  - managed_policies: A list of ARNs of managed policies to attach to the permission set.
  - customer_managed_policies: A list of customer-managed policies to attach to the permission set. Each policy includes:
      - name: The name of the customer-managed policy.
      - path: The path of the customer-managed policy (default is "/").
  EOF
  type = map(object({
    name             = string
    description      = string
    session_duration = optional(string, null)
    relay_state      = optional(string, null)
    tags             = optional(map(string))
    inline_policy    = string
    managed_policies = list(string)
    customer_managed_policies = list(object({
      name = string
      path = optional(string, "/")
    }))
  }))

  validation {
    condition     = alltrue([for ps in var.permission_sets : (ps.inline_policy != null)])
    error_message = "Inline policy cannot be null"
  }
  validation {
    condition     = alltrue([for ps in var.permission_sets : can(jsondecode(ps.inline_policy)) if ps.inline_policy != ""])
    error_message = "Inline policy must be a valid JSON string."
  }
  validation {
    condition     = alltrue([for ps in var.permission_sets : (ps.managed_policies != null)])
    error_message = "Managed policies cannot be null"
  }
  validation {
    condition     = alltrue([for ps in var.permission_sets : (ps.customer_managed_policies != null)])
    error_message = "Customer managed policies cannot be null "
  }

}

variable "tags" {
  description = "(Optional) Key-value map of resource tags."
  type        = map(string)
  default     = null
}
