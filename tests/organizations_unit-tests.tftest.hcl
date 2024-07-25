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
