resource "aws_vpc" "vpc_3tier" {
  cidr_block = var.vpc_cidr
  tags       = {}
}

resource "aws_subnet" "private_subnet_3tier" {
  vpc_id            = aws_vpc.vpc_3tier.id
  count             = length(var.vpc_private_subnet)
  cidr_block        = element(var.vpc_private_subnet, count.index)
  availability_zone = element(var.vpc_azs, count.index)
  tags              = {}
}
