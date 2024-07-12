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
    error_message = "Group name 'Dummy_Group' doesn't match"
  }

  assert {
  condition     = aws_identitystore_group.this["Dummy_Group"].description == var.sso_groups["Dummy_Group"].group_description
  error_message = "Group description ${var.sso_groups["Dummy_Group"].group_description} doesn't match"
}
}
