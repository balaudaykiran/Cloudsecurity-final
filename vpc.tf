resource "aws_vpc" "lab6_vpc" {
  enable_dns_support   = true
  enable_dns_hostnames = true
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "lab6_subnet" {
  vpc_id     = aws_vpc.lab6_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_internet_gateway" "lab6_igw" {
  vpc_id = aws_vpc.lab6_vpc.id
}

resource "aws_route_table" "lab6_rt" {
  vpc_id = aws_vpc.lab6_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab6_igw.id
  }
}
resource "aws_route_table_association" "lab6_rt_asso" {
  subnet_id      = aws_subnet.lab6_subnet.id
  route_table_id = aws_route_table.lab6_rt.id
}
