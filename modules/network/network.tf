# VPC principal
resource "aws_vpc" "vpc_3tier" {
  cidr_block = var.vpc_cidr
  tags       = var.tags
}

# Subredes privadas
resource "aws_subnet" "private_subnet_3tier" {
  count             = length(var.vpc_private_subnets)
  vpc_id            = aws_vpc.vpc_3tier.id
  cidr_block        = var.vpc_private_subnets[count.index]
  availability_zone = var.vpc_azs[count.index]
  tags              = merge(var.general_tags, { "Name" = "subnet_privada_0${count.index + 1}" })
}

# Subredes publicas
resource "aws_subnet" "public_subnet_3tier" {
  count             = length(var.vpc_public_subnets)
  vpc_id            = aws_vpc.vpc_3tier.id
  cidr_block        = var.vpc_public_subnets[count.index]
  availability_zone = var.vpc_azs[count.index]
  tags              = merge(var.general_tags, { "Name" = "subnet_publica_0${count.index + 1}" })
}

# Subredes de DB
resource "aws_subnet" "db_subnet_3tier" {
  count             = length(var.vpc_db_subnets)
  vpc_id            = aws_vpc.vpc_3tier.id
  cidr_block        = var.vpc_db_subnets[count.index]
  availability_zone = var.vpc_azs[count.index]
  tags              = merge(var.general_tags, { "Name" = "subnet_db_0${count.index + 1}" })
}

# Internet Gateway
resource "aws_internet_gateway" "IGW_3tier" {
  vpc_id = aws_vpc.vpc_3tier.id
  tags   = merge(var.general_tags, { "Name" = "IGW_main" })
}

resource "aws_eip" "EIP_3tier" {
  domain = "vpc"
}

# NAT Gateway
resource "aws_nat_gateway" "NAT_3tier" {
  allocation_id = aws_eip.EIP_3tier.id
  subnet_id     = aws_subnet.public_subnet_3tier[0].id
  tags          = merge(var.general_tags, { "Name" = "NAT_main" })
}

# Tabla de enrutamiento subredes privadas
resource "aws_route_table" "private_subnet_RTB_3tier" {
  vpc_id = aws_vpc.vpc_3tier.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT_3tier.id
  }
}

# Tabla de enrutamiento subredes publicas
resource "aws_route_table" "public_subnet_RTB_3tier" {
  vpc_id = aws_vpc.vpc_3tier.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW_3tier.id
  }
}
