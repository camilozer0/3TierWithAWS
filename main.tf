# Creacion de la VPC
module "vpc" {
  source              = "./modules/network"
  vpc_name            = var.vpc_name
  vpc_cidr            = var.vpc_cidr
  vpc_azs             = var.vpc_azs
  vpc_private_subnets = var.vpc_private_subnets
  vpc_public_subnets  = var.vpc_public_subnets
  vpc_db_subnets      = var.vpc_db_subnets

  tags = merge(var.general_tags,
    {
      "Name" = "vpc_main"
    }
  )
  general_tags = var.general_tags
}
