# Attribute validations for account sub module
run "account_parentId_match" {
  command = plan

  variables {
    name               = "some_user_name"
    email              = "randomPrefix@randomDomain.com"
    parent_id          = "ou-rndm-parentid"
    expected_parent_id = "ou-rndm-parentid"
  }

  module {
    source = "./modules/account/"
  }

  assert {
    condition     = aws_organizations_account.member_account.parent_id == var.expected_parent_id
    error_message = "Account parent_id mismatch after creation"
  }
}

run "account_name_match" {
  command = plan

  variables {
    name          = "some_user_name"
    email         = "randomPrefix@randomDomain.com"
    parent_id     = "ou-rndm-parentid"
    expected_name = "some_user_name"
  }

  module {
    source = "./modules/account/"
  }

  assert {
    condition     = aws_organizations_account.member_account.name == var.expected_name
    error_message = "Account name mismatch after creation"
  }
}

run "account_email_match" {
  command = plan

  variables {
    name           = "some_user_name"
    email          = "randomPrefix@randomDomain.com"
    parent_id      = "ou-rndm-parentid"
    expected_email = "randomPrefix@randomDomain.com"
  }

  module {
    source = "./modules/account/"
  }

  assert {
    condition     = aws_organizations_account.member_account.email == var.expected_email
    error_message = "Account email mismatch after creation"
  }
}

run "account_iam_user_billing_access_enabled" {
  command = plan

  module {
    source = "./modules/account/"
  }

  variables {
    name                       = "test_user"
    email                      = "randomPrefix@randomDomain.com"
    parent_id                  = "ou-rndm-parentid"
    iam_user_access_to_billing = "ALLOW"
  }

  assert {
    condition     = aws_organizations_account.member_account.iam_user_access_to_billing == "ALLOW"
    error_message = "IAM user access to billing not enabled as expected"
  }
}

run "account_tags_match" {
  command = plan

  module {
    source = "./modules/account/"
  }

  variables {
    name      = "some_user_name"
    email     = "randomPrefix@randomDomain.com"
    parent_id = "ou-rndm-parentid"
    tags = {
      "some_key_name"    = "some_value"
      "another_key_name" = "another_value"
    }
  }

  assert {
    condition     = aws_organizations_account.member_account.tags["some_key_name"] == "some_value"
    error_message = "Tag 'some_key_name' with value 'some_value' is missing or incorrect"
  }

  assert {
    condition     = aws_organizations_account.member_account.tags["another_key_name"] == "another_value"
    error_message = "Tag 'another_key_name' with value 'another_value' is missing or incorrect"
  }
}

# Attribute validations for organization_unit sub module
run "organizationalUnit_name_match" {
  command = plan

  module {
    source = "./modules/organizational_unit/"
  }

  variables {
    name      = "some_organizationUnit_name"
    parent_id = "ou-rndm-parentid"
    tags = {
      "some_key_name"    = "some_value"
      "another_key_name" = "another_value"
    }
    expected_name = "some_organizationUnit_name"
  }

  assert {
    condition     = aws_organizations_organizational_unit.org_unit.name == var.expected_name
    error_message = "Organization unit name mismatch after creation"
  }
}

run "organizationalUnit_parentId_match" {
  command = plan

  module {
    source = "./modules/organizational_unit/"
  }

  variables {
    name      = "some_organizationUnit_name"
    parent_id = "ou-rndm-parentid"
    tags = {
      "some_key_name"    = "some_value"
      "another_key_name" = "another_value"
    }
    expected_parent_id = "ou-rndm-parentid"
  }

  assert {
    condition     = aws_organizations_organizational_unit.org_unit.parent_id == var.expected_parent_id
    error_message = "Organization unit name mismatch after creation"
  }
}

run "organizationalUnit_tags_match" {
  command = plan

  module {
    source = "./modules/organizational_unit/"
  }

  variables {
    name      = "some_organizationUnit_name"
    parent_id = "ou-rndm-parentid"
    tags = {
      "some_key_name"    = "some_value"
      "another_key_name" = "another_value"
    }
  }

  assert {
    condition     = aws_organizations_organizational_unit.org_unit.tags["some_key_name"] == "some_value"
    error_message = "Tag 'some_key_name' with value 'some_value' is missing or incorrect"
  }
  assert {
    condition     = aws_organizations_organizational_unit.org_unit.tags["another_key_name"] == "another_value"
    error_message = "Tag 'another_key_name' with value 'another_value' is missing or incorrect"
  }
}

# Attribute validations for organization module
run "organization_aws_service_access_principals_match" {
  command = plan

  variables {
    service_access_principals              = ["service1.amazonaws.com", "service2.amazonaws.com"]
    expected_aws_service_access_principals = ["service1.amazonaws.com", "service2.amazonaws.com"]
    enabled_policy_types                   = ["SERVICE_CONTROL_POLICY"]
    feature_set                            = "ALL"
  }

  module {
    source = "./"
  }

  assert {
    condition     = toset(aws_organizations_organization.org.aws_service_access_principals) == toset(var.expected_aws_service_access_principals)
    error_message = "AWS service access principals mismatch after creation"
  }
}

run "organization_enabled_policy_types_match" {
  command = plan

  variables {
    service_access_principals     = ["service1.amazonaws.com", "service2.amazonaws.com"]
    enabled_policy_types          = ["SERVICE_CONTROL_POLICY"]
    expected_enabled_policy_types = ["SERVICE_CONTROL_POLICY"]
    feature_set                   = "ALL"
  }

  module {
    source = "./"
  }

  assert {
    condition     = toset(aws_organizations_organization.org.enabled_policy_types) == toset(var.expected_enabled_policy_types)
    error_message = "Enabled policy types mismatch after creation"
  }
}

run "organization_feature_set_match" {
  command = plan

  variables {
    service_access_principals = ["service1.amazonaws.com", "service2.amazonaws.com"]
    enabled_policy_types      = ["SERVICE_CONTROL_POLICY"]
    feature_set               = "ALL"
    expected_feature_set      = "ALL"
  }

  module {
    source = "./"
  }

  assert {
    condition     = aws_organizations_organization.org.feature_set == var.expected_feature_set
    error_message = "Feature set mismatch after creation"
  }
}

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
