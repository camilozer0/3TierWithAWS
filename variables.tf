variable "aws_profile" {
  type    = string
  default = "camilozero"
}

variable "vpc_name" {
  description = "nombre para la vpc"
  type        = string
}

variable "vpc_cidr" {
  description = "bloque cidr para la vpc"
  type        = string
}

# Variables para las subnets
variable "vpc_azs" {
  description = "zonas de disponibilidad para la vpc"
  type        = list(string)
}

variable "vpc_private_subnets" {
  description = "subnets publicas"
  type        = list(string)
}

variable "vpc_public_subnets" {
  description = "subnets publicas"
  type        = list(string)
}

variable "vpc_db_subnets" {
  description = "subnet de base de datos"
  type        = list(string)
}
variable "general_tags" {
  description = "etiquetas para poner al vpc peering para api - data vpc"
  type        = map(string)
  default = {
    "ProjectName" = "3TierWithAWS"
    "CreatedBy"   = "CamiloZer0"
  }
}


