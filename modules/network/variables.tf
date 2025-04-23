variable "vpc_name" {
  description = "nombre para la vpc"
  type        = string
  default     = "vpc"
}

variable "vpc_cidr" {
  description = "bloque cidr para la vpc"
  type        = string
}

variable "vpc_azs" {
  description = "zonas de disponibilidad para la vpc"
  type        = list(string)
}

variable "vpc_public_subnets" {
  description = "subnets publicas"
  type        = list(string)
}

variable "vpc_private_subnets" {
  description = "subnets privadas"
  type        = list(string)
}

variable "vpc_db_subnets" {
  description = "subnet de base de datos"
  type        = list(string)
}

variable "tags" {
  description = "tags para los recursos creados"
  type        = map(string)
  default     = {}
}

variable "general_tags" {
  description = "tags generales del proyecto"
  type        = map(string)
  default     = {}
}

