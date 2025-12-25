data "aws_availability_zones" "available" {
    state = "available"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc-name
  }
}

resource "aws_subnet" "public" {
  count = 2
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
        Name= "three_public_subnet_${count.index}"
    }
}


resource "aws_subnet" "private" {
  count = 2
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index+10)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
        Name = "three_private_subnet_${count.index}"
  }
}


resource "aws_internet_gateway" "aws_ig" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw-name
  }
}

resource "aws_route_table" "route_table" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block= "0.0.0.0/0"
        gateway_id= aws_internet_gateway.aws_ig.id
    }
    tags = {
        Name = var.rt-name
    }
}

resource "aws_route_table_association" "aws_rt_asso" {
    count=2
    subnet_id = aws_subnet.public[count.index].id
    route_table_id = aws_route_table.route_table.id 
}