# Attribute validations for permission_sets sub module
run "check_permission_set_creation" {
  module {
    source = "./modules/permission_sets"
  }
  variables {
    permission_sets = [
      {
        name        = "dummy"
        description = "This is only used for testing purpose"
      }
    ]
  }
  command = plan

  assert {
    condition     = length(aws_ssoadmin_permission_set.this) == 1
    error_message = "Permission set `dummy` was not created"
  }
}

run "validate_permission_set_name" {
  module {
    source = "./modules/permission_sets"
  }
  variables {
    permission_sets = [
      {
        name        = "dummy"
        description = "This is only used for testing purpose"
      }
    ]
  }
  command = plan

  assert {
    condition     = aws_ssoadmin_permission_set.this[var.permission_sets[0].name].name == var.permission_sets[0].name
    error_message = "Invalid permission set name"
  }
}

run "validate_permission_set_description" {
  module {
    source = "./modules/permission_sets"
  }
  variables {
    permission_sets = [
      {
        name        = "dummy"
        description = "This is only used for testing purpose"
      }
    ]
  }
  command = plan

  assert {
    condition     = aws_ssoadmin_permission_set.this[var.permission_sets[0].name].description == var.permission_sets[0].description
    error_message = "Invalid permission set name"
  }
}
