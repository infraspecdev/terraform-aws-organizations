terraform {
  required_version = ">= 1.8.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.51.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.2"
    }
  }
}
