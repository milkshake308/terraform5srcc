variable "aws_region" {
  description = "The AWS region to deploy ressources."
  type        = string
  default     = "eu-west-3"
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
