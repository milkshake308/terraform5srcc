variable "target_subnet_ids" {
  description = "The target(s) of subnet(s) to deploy the EKS Cluster."
  type        = list(string)
}

variable "target_vpc_id" {
  description = "The target VPC ID to deploy the EKS Cluster."
  type        = string
}

variable "module_prefix" {
  description = "The prefix prepended to deployed ressource's name."
  type        = string
  default     = "eks-cluster-"
}

variable "cluster_name" {
  description = "The name of the deployed EKS cluster."
  type        = string
  default     = "eks-cluster"
}

variable "eks_ec2_instance_type" {
  description = "EKS EC2 workers node type."
  type        = string
  default     = "t2.micro"
}

variable "eks_ec2_security_group_id" {
  description = "EKS EC2 Security Group ID."
  type        = string
}

variable "scaling_desired_size" {
  description = "The desired size (nodes) of the EKS cluster/"
  type        = number
  default     = 2
}

variable "scaling_max_size" {
  description = "The maximum size (nodes) of the EKS cluster/"
  type        = number
  default     = 3
}

variable "scaling_min_size" {
  description = "The minimum size (nodes) of the EKS cluster/"
  type        = number
  default     = 1
}

variable "aws_ec2_capacity_type" {
  description = "The AWS EC2 instance's capacity type to deploy"
  type        = string
}
