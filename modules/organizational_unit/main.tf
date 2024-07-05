resource "aws_organizations_organizational_unit" "org_unit" {
  name      = var.name
  parent_id = var.parent_id != "" ? var.parent_id : data.aws_organizations_organization.org.roots[0].id
  tags      = var.tags
}
