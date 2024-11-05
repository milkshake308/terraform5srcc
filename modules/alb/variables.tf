variable "target_vpc_id" {
  description = "The target VPC ID to deploy the EKS Cluster."
  type        = string
}

variable "module_prefix" {
  description = "The prefix prepended to deployed ressource's name."
  type        = string
  default     = "alb-"
}

variable "eks_cluster_name" {
  description = "The name of the deployed EKS cluster."
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy ressources."
  type        = string
}


variable "eks_oidc_provider_fingerprint" {
  description = "The EKS OIDC provider fingerprint"
  type        = string
}

variable "eks_oidc_url" {
  description = "The EKS OIDC URL"
  type        = string
}

locals {
  strip_eks_oidc_uri = replace(var.eks_oidc_url, "https://", "")
}
