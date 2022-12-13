module "vpc" {
  source = "./vpc"
}

module "compute" {
  source = "./compute"
  public-subnets = module.vpc.public-subnets
  private-subnets = module.vpc.private-subnets
  vpc = module.vpc.vpc
  nat = module.vpc.nat
}

module "monitoring" {
  source = "./monitoring"
  instances = module.compute.ec2-instance  
}

module "lambda" {
  source = "./lambdas"
  public-ip = module.compute.dns
}