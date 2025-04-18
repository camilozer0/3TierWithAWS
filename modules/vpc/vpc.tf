resource "aws_vpc" "vpc_3tier" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name"      = var.vpc_tags.Name
    "CreatedBy" = var.vpc_tags.CreatedBy
  }
}
