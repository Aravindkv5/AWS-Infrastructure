# main.tf

provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source     = "../../../modules/VPC"
  vpc_cidr   = var.vpc_cidr
}

module "subnets" {
  source               = "../../../modules/VPC"
  vpc_id               = module.vpc.vpc_id
  availability_zones   = var.availability_zones
}

module "route_table" {
  source               = "../../../modules/VPC"
  vpc_id               = module.vpc.vpc_id
  public_subnet_id     = module.subnets.public_subnet
}
