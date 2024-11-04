# modules/vpc/main.tf


resource "aws_subnet" "public_subnet" {
  # https://developer.hashicorp.com/terraform/language/meta-arguments/count
  count             = var.public_subnet_count
  vpc_id            = aws_vpc.core_compute_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.core_compute_vpc.cidr_block, 8, count.index)  
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${aws_vpc.core_compute_vpc.tags["Name"]}-public-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.core_compute_vpc.id
  
  tags = {
    Name = "${aws_vpc.core_compute_vpc.tags["Name"]}-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.core_compute_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${aws_vpc.core_compute_vpc.tags["Name"]}-public-rt"
  }
}

resource "aws_route_table_association" "public_rta" {
  count          = var.public_subnet_count
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}
