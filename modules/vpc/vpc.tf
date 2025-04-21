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
