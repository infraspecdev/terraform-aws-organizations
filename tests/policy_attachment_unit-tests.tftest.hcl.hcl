run "policy_attachment_policy_id_match" {
  command = plan

  module {
    source = "./modules/policy_attachment/"
  }

  variables {
    policy_id          = "p-12345678"
    target_id          = "r-1234"
    skip_destroy       = true
    expected_policy_id = "p-12345678"
  }

  assert {
    condition     = aws_organizations_policy_attachment.this.policy_id == var.expected_policy_id
    error_message = "Policy ID mismatch after attachment"
  }
}

run "policy_attachment_target_id_match" {
  command = plan

  module {
    source = "./modules/policy_attachment/"
  }

  variables {
    policy_id          = "p-12345678"
    target_id          = "r-1234"
    skip_destroy       = true
    expected_target_id = "r-1234"
  }

  assert {
    condition     = aws_organizations_policy_attachment.this.target_id == var.expected_target_id
    error_message = "Target ID mismatch after attachment"
  }
}

run "policy_attachment_skip_destroy_match" {
  command = plan

  module {
    source = "./modules/policy_attachment/"
  }

  variables {
    policy_id             = "p-12345678"
    target_id             = "r-1234"
    skip_destroy          = true
    expected_skip_destroy = true
  }

  assert {
    condition     = aws_organizations_policy_attachment.this.skip_destroy == var.expected_skip_destroy
    error_message = "Skip destroy mismatch after attachment"
  }
}
