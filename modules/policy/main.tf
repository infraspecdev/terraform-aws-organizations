resource "aws_organizations_policy" "this" {
  content      = var.content
  name         = var.name
  description  = var.description
  skip_destroy = var.skip_destroy
  type         = var.type
  tags         = var.tags
}

resource "aws_organizations_policy_attachment" "this" {
  policy_id    = aws_organizations_policy.this.id
  target_id    = var.target_id
  skip_destroy = var.skip_destroy
}
