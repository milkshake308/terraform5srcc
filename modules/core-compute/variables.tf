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