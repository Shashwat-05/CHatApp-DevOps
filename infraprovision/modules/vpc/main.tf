resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = var.name
    Env  = var.env
  }
}

# Create a default security for the vpc
resource "aws_security_group" "default" {
  name        = "${var.name}-default-sg"
  description = "Default security group to allow inbound/outbound from the VPC"
  vpc_id      = aws_vpc.vpc.id
  depends_on  = [aws_vpc.vpc]

  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = "true"
  }
  tags = {
    Env = var.env
  }
}

#-----------------------------
# This will be used by the public subnets
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.name}-igw"
    Env  = var.env
  }
}

# resource "aws_route_table" "Public-Subnet-RT" {
#   depends_on = [
#     aws_vpc.custom,
#     aws_internet_gateway.ig
#   ]

#    # VPC ID
#   vpc_id = aws_vpc.custom.id

#   # NAT Rule
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.ig.id
#   }

#   tags = {
#     Name = "Route Table for Internet Gateway"
#   }
# }