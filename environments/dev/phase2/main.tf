module "app" {
  source                   = "../../modules/app"
  cluster_id               = data.terraform_remote_state.phase1.outputs.ecs_cluster_id
  execution_role_arn       = data.terraform_remote_state.phase1.outputs.execution_role_arn
  private_subnets          = data.terraform_remote_state.phase1.outputs.private_subnets
  shared_security_group_id = data.terraform_remote_state.phase1.outputs.shared_security_group_id
  target_group_arn         = data.terraform_remote_state.phase1.outputs.target_group_arn
  alb_listener_arn         = data.terraform_remote_state.phase1.outputs.alb_listener_arn
  ecr_repo_url             = data.terraform_remote_state.phase1.outputs.repository_url
  image_tag                = var.image_tag
  name_prefix              = var.name_prefix
}

data "terraform_remote_state" "phase1" {
  backend = "s3"
  config = {
    bucket = "your-terraform-state-bucket"
    key    = "dev/phase1/terraform.tfstate"
    region = "us-east-2"
  }
}
