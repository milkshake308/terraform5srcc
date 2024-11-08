output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.core_compute_vpc.id
}

output "ec2_security_group_id" {
  description = "ID of Security Group"
  value       = aws_security_group.core_compute_ec2_sg.id
}
output "public_subnet_ids" {
  description = "ID of Public Subnets"
  value       = aws_subnet.public_subnet[*].id # Due to the usage of count attribute
}

output "public_internet_gateway_id" {
  description = "ID of Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "private_subnet_ids" {
  description = "ID of Private Subnets"
  value       = aws_subnet.private_subnet[*].id # Due to the usage of count attribute
}

output "private_nat_gateway_id" {
  description = "ID of Nat Gateway"
  value       = aws_nat_gateway.nat_gw.id
}

output "private_nat_gateway_public_ip" {
  description = "Public IP address of NAT GW"
  value       = aws_nat_gateway.nat_gw.public_ip
}
