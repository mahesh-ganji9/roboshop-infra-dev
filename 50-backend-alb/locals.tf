locals {

  backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.id
  common_tags = {
    project   = var.project
    env       = var.env
    terraform = "true"
  private_subnet_ids = split(",",data.aws_ssm_parameter.private_subnet_ids.value)
  }
}