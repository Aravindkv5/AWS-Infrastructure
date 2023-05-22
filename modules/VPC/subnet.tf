# modules/subnet/main.tf

#variable "availability_zones" {}

resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone = var.availability_zones[count.index]
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}

resource "aws_subnet" "public" {
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 100)
  availability_zone = var.availability_zones[0]
}

output "public_subnet" {
  value = aws_subnet.public.id
}
