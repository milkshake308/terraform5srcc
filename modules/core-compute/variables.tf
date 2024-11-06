variable "public_subnet_count" {
  description = "The number of public subnet to deploy."
  type        = number
  default     = 3
}

variable "private_subnet_count" {
  description = "The number of public subnet to deploy."
  type        = number
  default     = 3
}

variable "module_prefix" {
  description = "The prefix prepended to deployed ressource's name"
  type        = string
  default     = "core-compute-"
}

variable "cluster_name" {
  description = "The name of the EKS cluster for subnet auto discovery"
  type        = string
  nullable    = true
}

variable "eks_subnet_attachement_policy" {
  description = "The type of attachement policy for vpc subnets; possible values : shared, owned"
  type        = string
  default     = "shared"
}
