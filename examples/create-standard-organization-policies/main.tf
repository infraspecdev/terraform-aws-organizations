module "tag_policy" {
  source      = "../../modules/policy"
  content     = local.tag_policy_file_content
  name        = local.tag_policy_name
  description = local.tag_policy_description
  type        = local.tag_policy_type
  tags        = local.default_tags
}


module "attach_tag_policy" {
  source    = "../../modules/policy_attachment"
  policy_id = module.tag_policy.aws_organizations_policy_id
  target_id = local.tag_policy_taget_id
}
