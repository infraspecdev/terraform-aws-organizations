run "validate_account_id_for_non_digits_value" {
  variables {
    account_assignments = [{
      account_id      = "dummyId"
      permission_sets = [""]
      principal_names = [""]
      principal_type  = "GROUP"
      }
    ]
  }
  module {
    source = "./modules/account_permissions_assignment"
  }
  command = plan
  expect_failures = [
    var.account_assignments.this[0].account_id
  ]
}

run "validate_account_id_digits" {
  variables {
    account_assignments = [{
      account_id      = "dummyId"
      permission_sets = [""]
      principal_names = [""]
      principal_type  = "GROUP"
      }
    ]
  }
  module {
    source = "./modules/account_permissions_assignment"
  }
  command = plan
  expect_failures = [
    var.account_assignments.this[0].account_id
  ]
}

run "validate_empty_permission_sets_list" {
  variables {
    account_assignments = [{
      account_id      = "123456789012"
      permission_sets = []
      principal_names = [""]
      principal_type  = "GROUP"
      }
    ]
  }
  module {
    source = "./modules/account_permissions_assignment"
  }
  command = plan
  expect_failures = [
    var.account_assignments.this[0].permission_sets
  ]
}

run "validate_empty_principal_list" {
  variables {
    account_assignments = [{
      account_id      = "123456789012"
      permission_sets = [""]
      principal_names = []
      principal_type  = "GROUP"
      }
    ]
  }
  module {
    source = "./modules/account_permissions_assignment"
  }
  command = plan
  expect_failures = [
    var.account_assignments.this[0].principal_names
  ]
}

run "validate_principal_type" {
  variables {
    account_assignments = [{
      account_id      = "123456789012"
      permission_sets = [""]
      principal_names = [""]
      principal_type  = ""
      }
    ]
  }
  module {
    source = "./modules/account_permissions_assignment"
  }
  command = plan
  expect_failures = [
    var.account_assignments.this[0].principal_type
  ]
}
