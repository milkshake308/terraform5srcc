resource "aws_vpc" "core_compute_vpc" {
  cidr_block = "10.53.0.0/16"

  tags = {
    Name = "core-compute-vpc"
  }
}

resource "aws_security_group" "core_compute_ec2_sg" {
  vpc_id = aws_vpc.core_compute_vpc.id

  tags = {
    Name = "core-compute-ec2-security-group"
  }

  # Dont mix inline rules with aws_security_group_rule resource
  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # HTTPS
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Allow all outbound
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
