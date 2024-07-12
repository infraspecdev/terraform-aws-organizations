variable "sso_groups" {
  type = map(object(
    {
      group_name        = string
      group_description = string
    }
  ))
  default = {}
}
