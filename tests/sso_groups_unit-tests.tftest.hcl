
#Argument validation for user-group-assignment module
run "check_for_invalid_user" {
  command = plan

  variables {
    user_groups_mapping = {
      "dummyUser@gmail.com" = [
        "Group1"
      ]
    }
  }

  module {
    source = "./modules/sso_groups"
  }

  expect_failures = [
    var.user_groups_mapping
  ]
}

run "check_for_valid_user_with_no_groups" {
  command = plan

  variables {
    user_groups_mapping = {
      "dummyUser@gmail.com" = []
    }
  }

  module {
    source = "./modules/sso_groups"
  }

  expect_failures = [
    var.user_groups_mapping
  ]
}

run "check_for_invalid_group" {
  command = plan

  variables {
    user_groups_mapping = {
      "dummyUser@gmail.com" = [""]
    }
  }

  module {
    source = "./modules/sso_groups"
  }

  expect_failures = [
    var.user_groups_mapping
  ]
}
