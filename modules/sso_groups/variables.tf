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
  default = {}
}
