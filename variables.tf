variable "aws_profile" {
  type    = string
  default = "camilozero"
}

variable "projectName" {
  type        = list(string)
  description = "variable para los tags de los recursos a crearse dentro del proyecto"
}

variable "vpc_tags" {
  description = "etiquetas para poner al vpc peering para api - data vpc"
  type        = map(string)
  default = {
    "Name"      = "3TierWithAWS"
    "CreatedBy" = "CamiloZer0"
  }
}
