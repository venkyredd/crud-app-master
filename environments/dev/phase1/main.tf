module "vpc" {
  source      = "../../../modules/vpc"
  name_prefix = var.name_prefix
}

module "security_groups" {
  source      = "../../../modules/security_groups"
  vpc_id      = module.vpc.vpc_id
  name_prefix = var.name_prefix
}

module "ecs_cluster" {
  source      = "../../../modules/ecs_cluster"
  name_prefix = var.name_prefix
}

module "ecr" {
  source      = "../../../modules/ecr"
  name_prefix = var.name_prefix
}

module "alb" {
  source                   = "../../../modules/alb"
  vpc_id                   = module.vpc.vpc_id
  public_subnets           = module.vpc.public_subnets
  shared_security_group_id = module.security_groups.shared_security_group_id
  name_prefix              = var.name_prefix
}

module "iam" {
  source      = "../../../modules/iam"
  name_prefix = var.name_prefix
}
