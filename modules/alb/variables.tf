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
