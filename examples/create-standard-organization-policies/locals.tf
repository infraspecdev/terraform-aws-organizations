locals {
  aws_region              = "ap-south-1"
  tag_policy_file_content = file("${path.module}/tag_policy.json")
  tag_policy_name         = "STANDARD_TAG_POLICIES"
  tag_policy_description  = "Recommend tag policies"
  tag_policy_type         = "TAG_POLICY"
  default_tags            = {}
  tag_policy_taget_id     = "123456789098"
}
