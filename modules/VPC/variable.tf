# variables.tf

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default = "value"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}
