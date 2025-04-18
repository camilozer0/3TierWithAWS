variable "aws_profile" {
  type    = string
  default = "camilozero"
}

variable "projectName" {
  type        = list(string)
  description = "variable para los tags de los recursos a crearse dentro del proyecto"
}
