terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # Didnt found a way to avoid hard-coding this :(
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

module "core-compute" {
  source = "./modules/core-compute"
}

module "eks-cluster" {
  source                    = "./modules/eks-cluster"
  eks_ec2_security_group_id = module.core-compute.ec2_security_group_id
  target_subnet_ids         = concat(module.core-compute.public_subnet_ids, module.core-compute.private_subnet_ids)
  target_vpc_id             = module.core-compute.vpc_id
  depends_on                = [ module.core-compute ]
  scaling_desired_size      = 3
  scaling_max_size          = 4
  scaling_min_size          = 1
}
