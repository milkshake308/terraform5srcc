data "aws_availability_zones" "available" {}

resource "aws_vpc" "core_compute_vpc" {
  cidr_block = "10.53.0.0/16"

  tags = {
    Name = "core-compute-vpc"
  }
}
