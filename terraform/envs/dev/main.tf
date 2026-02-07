# Network Module
module "network" {
  source = "../../modules/network"

  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
}

# ECS Module
module "ecs" {
  source = "../../modules/ecs"

  environment                  = var.environment
  app_name                     = var.app_name
  vpc_id                       = module.network.vpc_id
  private_subnet_ids           = module.network.private_subnet_ids
  public_subnet_ids            = module.network.public_subnet_ids
  alb_security_group_id        = module.network.alb_security_group_id
  ecs_tasks_security_group_id  = module.network.ecs_tasks_security_group_id
  container_port               = var.container_port
  desired_count                = var.desired_count
}