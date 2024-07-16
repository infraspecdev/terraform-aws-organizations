variable "permission_sets" {
  description = <<EOF
  (Required)A map of permission set objects with key as the permission set name. Each object contains:
  - name: The name of the permission set.
  - description: A brief description of the permission set.
  - session_duration: Optional session duration for the permission set (default is null).
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
}
