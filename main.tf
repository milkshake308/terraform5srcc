terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket  = "terraform-5srcc-grp1"
    key     = "terraform/state.tfstate"
    profile = "5srcc"
    region  = "eu-west-3"
    encrypt = true
  }

}

provider "aws" {
  region    = var.aws_region
  profile   = "5srcc"           # This assumes that a configured 5srcc profile exist in your AWS CLI !
}
