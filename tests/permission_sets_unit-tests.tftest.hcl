# Attribute validations for permission_sets sub module
run "validate_inline_policy" {
  module {
    source = "./modules/permission_sets"
  }
  variables {
    permission_sets = {
      "dummy_ps" = {
        name                      = "dummy_ps"
        description               = "This is only used for testing purpose"
        inline_policy             = null
        managed_policies          = []
        customer_managed_policies = []
      }
    }
  }

  command = plan
  expect_failures = [
    var.permission_sets["dummy_ps"]
  ]
}

run "validate_inline_policy_json_content" {
  module {
    source = "./modules/permission_sets"
  }
  variables {
    permission_sets = {
      "dummy_ps" = {
        name                      = "dummy_ps"
        description               = "This is only used for testing purpose"
        inline_policy             = "invalid json"
        managed_policies          = []
        customer_managed_policies = []
      }
    }
  }

  command = plan
  expect_failures = [
    var.permission_sets["dummy_ps"]
  ]
}


run "validate_permission_set_name" {
  module {
    source = "./modules/permission_sets"
  }
  variables {
    permission_sets = {
      "dummy_ps" = {
        name                      = "dummy_ps"
        description               = "This is only used for testing purpose"
        inline_policy             = "{}"
        managed_policies          = []
        customer_managed_policies = []
      }
    }
  }
  command = plan

  assert {
    condition     = aws_ssoadmin_permission_set.this["dummy_ps"].name == var.permission_sets["dummy_ps"].name
    error_message = "Permission set name doesn't match"
  }
}

run "validate_permission_set_description" {
  module {
    source = "./modules/permission_sets"
  }
  variables {
    permission_sets = {
      "dummy_ps" = {
        name                      = "dummy_ps"
        description               = "This is only used for testing purpose"
        inline_policy             = "{}"
        managed_policies          = []
        customer_managed_policies = []
      },
    }
  }
  command = plan

  assert {
    condition     = aws_ssoadmin_permission_set.this["dummy_ps"].description == var.permission_sets["dummy_ps"].description
    error_message = "Permission set description doesn't match"
  }
}

run "check_permission_set_creation" {
  module {
    source = "./modules/permission_sets"
  }
  variables {
    permission_sets = {
      "dummy_ps" = {
        name                      = "dummy_ps"
        description               = "This is only used for testing purpose"
        inline_policy             = ""
        managed_policies          = []
        customer_managed_policies = []
      },
    }
  }
  command = apply

  assert {
    condition     = can(aws_ssoadmin_permission_set.this["dummy_ps"])
    error_message = "Permission set was not created"
  }
}
