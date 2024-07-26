
#Argument validation for user-group-assignment module
variables {
  sso_groups = {
    "Dummy_Group" = {
      group_name        = "Dummy_Group"
      group_description = "A Dummy Group"
    }
  }
}

run "check_for_valid_user_with_no_groups" {
  command = plan

  variables {
    user_groups_map = {
      "dummyUser@gmail.com" = []
    }
    sso_groups = var.sso_groups
  }

  module {
    source = "./modules/sso_groups"
  }

  expect_failures = [
    var.user_groups_map
  ]
}
