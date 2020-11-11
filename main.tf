provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source = "./resources/vpc"
  
  name = "octopus-vpc"

  cidr = "10.1.0.0/16"

  azs                 = ["eu-west-1a", "eu-west-1b"]
  private_subnets     = ["10.1.0.0/24", "10.1.10.0/24"]
  public_subnets      = ["10.1.20.0/24", "10.1.30.0/24"]

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true
  create_igw = true

  tags = {
    Environment = "staging"
    TerraConfig = "octopus"
  }
}

