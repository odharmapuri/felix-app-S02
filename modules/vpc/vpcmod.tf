#VPC Creation
resource "aws_vpc" "felix-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name    = "${var.project}-vpc"
    Project = "${var.project}"
  }
}
#Internet Gateway 
resource "aws_internet_gateway" "felix-igw" {
  vpc_id = aws_vpc.felix-vpc.id
  tags = {
    Name = "${var.project}-igw"
  }
}
#Subnet 1
resource "aws_subnet" "sn1" {
  availability_zone = var.zone1a
  vpc_id            = aws_vpc.felix-vpc.id
  cidr_block        = "10.0.1.0/24"
  #map_public_ip_on_launch = "true"
  tags = {
    Name = "${var.project}-sn1"
  }
}
#security group for Workstation
resource "aws_security_group" "work-sg" {
  name        = "work-sg"
  description = "Allow traffic"
  vpc_id      = aws_vpc.felix-vpc.id

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project}-work-sg"
  }
}
resource "aws_route_table" "route1" {
  vpc_id = aws_vpc.felix-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.felix-igw.id
  }
  tags = {
    Name = "${var.project}-route1"
  }
}
resource "aws_route_table_association" "rp1" {
  subnet_id      = aws_subnet.sn1.id
  route_table_id = aws_route_table.route1.id
}
