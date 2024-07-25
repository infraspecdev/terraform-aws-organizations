locals {
  aws_region              = "ap-south-1"
  tag_policy_file_content = file("${path.module}/tag_policy.json")
  tag_policy_name         = "STANDARD_TAG_POLICIES"
  tag_policy_description  = "Recommend tag policies"
  tag_policy_type         = "TAG_POLICY"
  default_tags            = {}
  tag_policy_taget_id     = "123456789098"
}

module "tag_policy" {
  source      = "../../modules/policy"
  content     = local.tag_policy_file_content
  name        = local.tag_policy_name
  description = local.tag_policy_description
  type        = local.tag_policy_type
  tags        = local.default_tags
  target_id   = local.tag_policy_taget_id
}
