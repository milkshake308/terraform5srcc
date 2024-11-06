terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "~> 2.16"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.33"
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
  profile   = "5srcc"
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.eks.token
  }
}

provider "kubernetes" {
  host                    = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate  = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                   = data.aws_eks_cluster_auth.eks.token
}


module "core-compute" {
  source                        = "./modules/core-compute"
  cluster_name                  = var.cluster_name
  private_subnet_count          = 3
  public_subnet_count           = 3
  eks_subnet_attachement_policy = "shared"
}

module "eks-cluster" {
  source                    = "./modules/eks-cluster"
  eks_ec2_security_group_id = module.core-compute.ec2_security_group_id
  target_subnet_ids         = concat(module.core-compute.public_subnet_ids, module.core-compute.private_subnet_ids)
  target_vpc_id             = module.core-compute.vpc_id
  depends_on                = [ module.core-compute ]
  scaling_desired_size      = var.scaling_desired_size
  scaling_max_size          = var.scaling_max_size
  scaling_min_size          = var.scaling_min_size
  cluster_name              = var.cluster_name
  aws_ec2_capacity_type     = var.aws_ec2_capacity_type
  eks_ec2_instance_type     = var.aws_instance_type
}

module "alb" {
  source                = "./modules/alb"
  target_vpc_id         = module.core-compute.vpc_id
  eks_cluster_name      = data.aws_eks_cluster.eks.name
  aws_region            = var.aws_region
  eks_oidc_url          = data.aws_eks_cluster.eks.identity[0].oidc[0].issuer
  depends_on            = [ module.eks-cluster ]
  eks_oidc_provider_fingerprint = data.external.oidc_provider_fingerprint.result.thumbprint
}
