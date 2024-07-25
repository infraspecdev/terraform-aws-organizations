run "organizationalUnit_name_match" {
  command = plan

  module {
    source = "./modules/organizational_unit/"
  }

  variables {
    name      = "some_organizationUnit_name"
    parent_id = "ou-rndm-parentid"
    tags = {
      "some_key_name"    = "some_value"
      "another_key_name" = "another_value"
    }
    expected_name = "some_organizationUnit_name"
  }

  assert {
    condition     = aws_organizations_organizational_unit.org_unit.name == var.expected_name
    error_message = "Organization unit name mismatch after creation"
  }
}

run "organizationalUnit_parentId_match" {
  command = plan

  module {
    source = "./modules/organizational_unit/"
  }

  variables {
    name      = "some_organizationUnit_name"
    parent_id = "ou-rndm-parentid"
    tags = {
      "some_key_name"    = "some_value"
      "another_key_name" = "another_value"
    }
    expected_parent_id = "ou-rndm-parentid"
  }

  assert {
    condition     = aws_organizations_organizational_unit.org_unit.parent_id == var.expected_parent_id
    error_message = "Organization unit name mismatch after creation"
  }
}

run "organizationalUnit_tags_match" {
  command = plan

  module {
    source = "./modules/organizational_unit/"
  }

  variables {
    name      = "some_organizationUnit_name"
    parent_id = "ou-rndm-parentid"
    tags = {
      "some_key_name"    = "some_value"
      "another_key_name" = "another_value"
    }
  }

  assert {
    condition     = aws_organizations_organizational_unit.org_unit.tags["some_key_name"] == "some_value"
    error_message = "Tag 'some_key_name' with value 'some_value' is missing or incorrect"
  }
  assert {
    condition     = aws_organizations_organizational_unit.org_unit.tags["another_key_name"] == "another_value"
    error_message = "Tag 'another_key_name' with value 'another_value' is missing or incorrect"
  }
}
