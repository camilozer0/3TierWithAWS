variable "vpc_name" {
  description = "nombre para la vpc"
  type        = string
  default     = "vpc"
}

variable "vpc_cidr" {
  description = "bloque cidr para la vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "zonas de disponibilidad para la vpc"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_public_subnets" {
  description = "subnets publicas"
  type        = list(string)
  default     = ["10.0.20.0/24", "10.0.21.0/24", "10.0.22.0/24"]
}

variable "vpc_private_subnet" {
  description = "subnets privadas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_db_subnets" {
  description = "subnet de base de datos"
  type        = list(string)
  default     = ["10.0.40.0/24", "10.0.41.0/24", "10.0.42.0/24"]
}

