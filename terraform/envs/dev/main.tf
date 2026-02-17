provider "aws" {
  region = "us-east-1"
}

module "network" {
  source           = "../../modules/network"
  environment      = "dev"
  vpc_cidr         = "10.0.0.0/16"
  public_subnets   = ["10.0.1.0/24"]
  private_subnets  = ["10.0.2.0/24"]
  azs              = ["us-east-1a"]
}

module "ecs" {
  source            = "../../modules/ecs"
  environment       = "dev"
  vpc_id            = module.network.vpc_id
  public_subnets    = module.network.public_subnet_ids
  private_subnets   = module.network.private_subnet_ids
  app_name          = "devsecops-app"
  container_image   = "${module.ecs.ecr_url}:latest"
  container_port    = 8080
}