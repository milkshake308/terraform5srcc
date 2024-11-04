output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.core_compute_vpc.id
}

# output "public_subnet_ids" {
#   description = "ID of Public Subnets"
#   value       = 
# }
