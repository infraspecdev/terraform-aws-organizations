variable "name" {
  description = "The name for the organizational unit."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "ID of the parent organizational unit, which may be the root."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Key-value map of resource tags."
  type        = map(string)
  default     = null
}
