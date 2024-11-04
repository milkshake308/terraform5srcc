resource "aws_vpc" "hello-world-5srcc" {
  cidr_block = "10.52.52.0/24"
  tags = {
    Name = "HelloWorldSRCC"
  }
}
