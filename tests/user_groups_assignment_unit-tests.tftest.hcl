#Argument validation for user-group-assignment module
run "check_for_invalid_user" {
  module {
    source = "./modules/user_groups_assignment"
  }

  variables {
    user_groups_mapping = {
      "dummyUser@gmail.com" = [
        "Group1"
      ]
    }
  }

  command = plan

  expect_failures = [
    var.user_groups_mapping
  ]
}

run "check_for_valid_user_with_no_groups" {
  module {
    source = "./modules/user_groups_assignment"
  }

  variables {
    user_groups_mapping = {
      "dummyUser@gmail.com" = []
    }
  }

  command = plan

  expect_failures = [
    var.user_groups_mapping
  ]
}

run "check_for_invalid_group" {
  module {
    source = "./modules/user_groups_assignment"
  }

  variables {
    user_groups_mapping = {
      "dummyUser@gmail.com" = [""]
    }
  }

  command = plan

  expect_failures = [
    var.user_groups_mapping
  ]
}
