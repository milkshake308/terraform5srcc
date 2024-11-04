terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region    = local.aws_region
  profile   = "5srcc"           # This assumes that a configured 5srcc profile exist in your AWS CLI !
}
