run "checks_identity_group_creation" {

  module {
    source = "./modules/sso_groups"
  }

  variables {
    sso_groups = {
      "Dummy_Group" = {
        group_name        = "Dummy_Group"
        group_description = "Dummy_Group for testing purpose"
      }
    }
  }

  command = plan

  assert {
    condition     = aws_identitystore_group.this["Dummy_Group"].display_name == "Dummy_Group"
    error_message = "Group 'Dummy_Group' doesn't match"
  }

  assert {
    condition     = aws_identitystore_group.this["Dummy_Group"].description == var.sso_groups["Dummy_Group"].group_description
    error_message = "Group description ${var.sso_groups["Dummy_Group"].group_description} doesn't match"
  }
}

run "check_for_empty_groups" {
  module {
    source = "./modules/sso_groups"
  }

  variables {
    user_groups_mapping = {
      "user" = []
    }
  }

  command = plan

  expect_failures = [
    var.user_groups_mapping["user"]
  ]
}
