variable "ec2_ami" {
  description = "ami for the ec2 instance"
  type        = map(string)
  default = {
    "linux"   = "ami-0e449927258d45bc4"
    "ubuntu"  = "ami-084568db4383264d4"
    "windows" = "ami-02e3d076cbd5c28fa"
    "redhat"  = "ami-0c15e602d3d6c6c4a"
  }
}
