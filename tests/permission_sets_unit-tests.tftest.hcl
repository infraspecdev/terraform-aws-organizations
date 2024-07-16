# Attribute validations for permission_sets sub module
run "validate_inline_policy" {
  command = plan

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

  module {
    source = "./modules/permission_sets"
  }

  expect_failures = [
    var.permission_sets["dummy_ps"]
  ]
}

run "validate_inline_policy_json_content" {
  command = plan

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

  module {
    source = "./modules/permission_sets"
  }

  expect_failures = [
    var.permission_sets["dummy_ps"]
  ]
}


run "validate_permission_set_name" {
  command = plan

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

  module {
    source = "./modules/permission_sets"
  }


  assert {
    condition     = aws_ssoadmin_permission_set.this["dummy_ps"].name == var.permission_sets["dummy_ps"].name
    error_message = "Permission set name doesn't match"
  }
}

run "validate_permission_set_description" {
  command = plan

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

  module {
    source = "./modules/permission_sets"
  }

  assert {
    condition     = aws_ssoadmin_permission_set.this["dummy_ps"].description == var.permission_sets["dummy_ps"].description
    error_message = "Permission set description doesn't match"
  }
}

run "check_permission_set_creation" {

  command = apply

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

  module {
    source = "./modules/permission_sets"
  }

  assert {
    condition     = can(aws_ssoadmin_permission_set.this["dummy_ps"])
    error_message = "Permission set was not created"
  }
}
