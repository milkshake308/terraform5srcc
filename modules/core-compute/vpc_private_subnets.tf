resource "aws_subnet" "private_subnet" {
  count             = var.private_subnet_count
  vpc_id            = aws_vpc.core_compute_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.core_compute_vpc.cidr_block, 8, count.index + var.public_subnet_count)  
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "${aws_vpc.core_compute_vpc.tags["Name"]}-private-subnet-${count.index + 1}"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = var.eks_subnet_attachement_policy
  }
}

resource "aws_eip" "nat_eip" {
    tags = {
        Name = "${var.module_prefix}elastic-ip"
    }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id    = aws_subnet.public_subnet[0].id # place nat gw in first subnet

  tags = {
    Name = "${var.module_prefix}nat-gw"
  }
}

# Create a route table for private subnets
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.core_compute_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "${aws_vpc.core_compute_vpc.tags["Name"]}-private-rt"
  }
}

resource "aws_route_table_association" "private_rta" {
  count          = var.private_subnet_count
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_rt.id
}
