resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/20"
  availability_zone =  "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet1"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"     = "1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.16.0/20"
  availability_zone =  "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet2"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"     = "1"
  }
}


resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.128.0/20"
  availability_zone =  "us-east-1a"

  tags = {
    Name = "private_subnet1"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"     = "1"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.144.0/20"
  availability_zone =  "us-east-1b"

  tags = {
    Name = "private_subnet2"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"     = "1"
  }
}
