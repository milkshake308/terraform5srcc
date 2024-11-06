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

variable "aws_ec2_capacity_type" {
  description = "The AWS EC2 instance's capacity type to deploy"
  type        = string
  default     = "ON_DEMAND" # Allowed values : "SPOT", "ON_DEMAND"
}

variable "aws_instance_type" {
  description = "The type of AWS EC2 instance to deploy"
  type        = string
  default     = "t2.micro"
}

variable "eks_subnet_attachement_policy" {
  description = "The type of attachement policy for vpc subnets; possible values : shared, owned"
  type        = string
  default     = "shared"
}
