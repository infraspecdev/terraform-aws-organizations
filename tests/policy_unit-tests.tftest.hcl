variables {
  tag_policy_content = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "tag:GetResources",
      "Resource": "*"
    }
  ]
}
EOF
}


run "policy_name_match" {
  command = plan

  module {
    source = "./modules/policy/"
  }

  variables {
    content       = var.tag_policy_content
    name          = "STANDARD_TAG_POLICIES"
    description   = "Recommend tag policies"
    type          = "TAG_POLICY"
    expected_name = "STANDARD_TAG_POLICIES"
    target_id     = "some-id"
    tags = {
      "some_key_name"    = "some_value"
      "another_key_name" = "another_value"
    }
  }

  assert {
    condition     = aws_organizations_policy.this.name == var.expected_name
    error_message = "Policy name mismatch after creation"
  }
}

run "policy_content_match" {
  command = plan

  module {
    source = "./modules/policy/"
  }

  variables {
    content          = var.tag_policy_content
    name             = "STANDARD_TAG_POLICIES"
    description      = "Recommend tag policies"
    type             = "TAG_POLICY"
    target_id        = "some-id"
    expected_content = var.tag_policy_content
    tags = {
      "some_key_name"    = "some_value"
      "another_key_name" = "another_value"
    }
  }

  assert {
    condition     = aws_organizations_policy.this.content == var.expected_content
    error_message = "Policy content mismatch after creation"
  }
}

run "policy_type_match" {
  command = plan

  module {
    source = "./modules/policy/"
  }

  variables {
    content       = var.tag_policy_content
    name          = "STANDARD_TAG_POLICIES"
    description   = "Recommend tag policies"
    type          = "TAG_POLICY"
    target_id     = "some-id"
    expected_type = "TAG_POLICY"
    tags = {
      "some_key_name"    = "some_value"
      "another_key_name" = "another_value"
    }
  }

  assert {
    condition     = aws_organizations_policy.this.type == var.expected_type
    error_message = "Policy type mismatch after creation"
  }
}

run "policy_description_match" {
  command = plan

  module {
    source = "./modules/policy/"
  }

  variables {
    content              = var.tag_policy_content
    name                 = "STANDARD_TAG_POLICIES"
    description          = "Recommend tag policies"
    expected_description = "Recommend tag policies"
    target_id            = "some-id"
    type                 = "TAG_POLICY"
    tags = {
      "some_key_name"    = "some_value"
      "another_key_name" = "another_value"
    }
  }

  assert {
    condition     = aws_organizations_policy.this.description == var.expected_description
    error_message = "Policy description mismatch after creation"
  }
}

run "policy_skip_destroy_match" {
  command = plan

  module {
    source = "./modules/policy/"
  }

  variables {
    content               = var.tag_policy_content
    name                  = "STANDARD_TAG_POLICIES"
    description           = "Recommend tag policies"
    type                  = "TAG_POLICY"
    skip_destroy          = true
    target_id             = "some-id"
    expected_skip_destroy = true
    tags = {
      "some_key_name"    = "some_value"
      "another_key_name" = "another_value"
    }
  }

  assert {
    condition     = aws_organizations_policy.this.skip_destroy == var.expected_skip_destroy
    error_message = "Policy skip_destroy mismatch after creation"
  }
}

run "policy_tags_match" {
  command = plan

  module {
    source = "./modules/policy/"
  }

  variables {
    content     = var.tag_policy_content
    name        = "STANDARD_TAG_POLICIES"
    description = "Recommend tag policies"
    type        = "TAG_POLICY"
    target_id   = "some-id"
    tags = {
      "some_key_name"    = "some_value"
      "another_key_name" = "another_value"
    }
  }

  assert {
    condition     = aws_organizations_policy.this.tags["some_key_name"] == "some_value"
    error_message = "Tag 'some_key_name' with value 'some_value' is missing or incorrect"
  }

  assert {
    condition     = aws_organizations_policy.this.tags["another_key_name"] == "another_value"
    error_message = "Tag 'another_key_name' with value 'another_value' is missing or incorrect"
  }
}
