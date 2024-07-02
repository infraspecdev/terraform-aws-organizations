variable "aws_service_access_principals" {
  description = "(Optional) List of AWS service principal names for which you want to enable integration with your organization."
  type        = list(string)
  default     = []
}

variable "aws_enabled_policy_types" {
  description = "(Optional) List of Organizations policy types to enable in the Organization Root."
  type        = list(string)
  default     = []
}

variable "aws_feature_set" {
  description = "(Optional) Specify \"ALL\" (default) or \"CONSOLIDATED_BILLING\"."
  type        = string
}
