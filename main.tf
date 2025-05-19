provider "aws" {
  region = var.aws_region
  profile = var.profile
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  vpc_name             = "${var.project_name}-${var.environment}"
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  environment          = var.environment
}

# Security Groups Module
module "security_groups" {
  source = "./modules/security_groups"

  project_name = var.project_name
  vpc_id      = module.vpc.vpc_id
  environment = var.environment
}

# ECS Module
module "ecs" {
  source = "./modules/ecs"

  project_name             = var.project_name
  environment              = var.environment
  aws_region               = var.aws_region
  vpc_id                   = module.vpc.vpc_id
  container_port           = var.container_port
  container_cpu            = var.container_cpu
  container_memory         = var.container_memory
  public_subnet_ids        = module.vpc.public_subnet_ids
  private_subnet_ids       = module.vpc.private_subnet_ids
  alb_security_group_id    = module.security_groups.alb_sg_id
  ecs_security_group_id    = module.security_groups.ecs_sg_id
  desired_count            = var.desired_count
  log_retention_in_days    = var.log_retention_in_days
  health_check_path        = var.health_check_path
}
