# Creacion de la VPC
module "vpc" {
  source = "./modules/vpc"
}

module "private_subnet" {
  source = "./modules/vpc"
}
