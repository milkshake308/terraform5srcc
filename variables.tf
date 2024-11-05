variable "aws_region" {
  description = "The AWS region to deploy ressources."
  type        = string
  default     = "eu-west-3"
}

variable "aws_cli_profile" {
  description = "The AWS CLI profile that holds the credentials."
  type        = string
  default     = "5srcc"
}

variable "cluster_name" {
  description = "The name of the deployed EKS to deploy."
  type        = string
  default     = "eks-cluster"
}

variable "scaling_desired_size" {
  description = "The desired size (nodes) of the EKS cluster/"
  type        = number
  default     = 3
}

variable "scaling_max_size" {
  description = "The maximum size (nodes) of the EKS cluster/"
  type        = number
  default     = 4
}

variable "scaling_min_size" {
  description = "The minimum size (nodes) of the EKS cluster/"
  type        = number
  default     = 1
}
