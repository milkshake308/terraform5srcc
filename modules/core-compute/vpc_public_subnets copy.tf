# # modules/vpc/main.tf


# resource "aws_subnet" "public_subnet" {
#   count             = var.public_subnet_count
#   vpc_id            = aws_vpc.core_compute_vpc.id
#   cidr_block        = cidrsubnet(aws_vpc.core_compute_vpc.cidr_block, 8, count.index)  
#   availability_zone = element(data.aws_availability_zones.available.names, count.index)
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "${aws_vpc.core_compute_vpc.tags["Name"]}_public_subnet_${count.index + 1}"
#   }
# }

# resource "aws_subnet" "private_subnet" {
#   count             = var.private_subnet_count
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = cidrsubnet(aws_vpc.my_vpc.cidr_block, 8, count.index + var.public_subnet_count)  
#   availability_zone = element(data.aws_availability_zones.available.names, count.index)

#   tags = {
#     Name = "${aws_vpc.core_compute_vpc.tags["Name"]}_public_subnet_${count.index + 1}"
#   }
# }

# # Create an Internet Gateway
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.my_vpc.id

#   tags = {
#     Name = "${var.vpc_name}_igw"
#   }
# }

# # Create a route table for public subnets
# resource "aws_route_table" "public_rt" {
#   vpc_id = aws_vpc.my_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name = "${var.vpc_name}_public_rt"
#   }
# }

# # Associate public subnets with the public route table
# resource "aws_route_table_association" "public_rta" {
#   count          = var.public_subnet_count
#   subnet_id      = aws_subnet.public_subnet[count.index].id
#   route_table_id = aws_route_table.public_rt.id
# }

# # Create a NAT Gateway
# resource "aws_eip" "nat_eip" {
#   vpc = true
# }

# resource "aws_nat_gateway" "nat_gw" {
#   allocation_id = aws_eip.nat_eip.id
#   subnet_id    = aws_subnet.public_subnet[0].id  # Place NAT in the first public subnet

#   tags = {
#     Name = "${var.vpc_name}_nat_gw"
#   }
# }

# # Create a route table for private subnets
# resource "aws_route_table" "private_rt" {
#   vpc_id = aws_vpc.my_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat_gw.id
#   }

#   tags = {
#     Name = "${var.vpc_name}_private_rt"
#   }
# }

# resource "aws_route_table_association" "private_rta" {
#   count          = var.private_subnet_count
#   subnet_id      = aws_subnet.private_subnet[count.index].id
#   route_table_id = aws_route_table.private_rt.id
# }

# data "aws_availability_zones" "available" {}
