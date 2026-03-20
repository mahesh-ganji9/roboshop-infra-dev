locals {
  
  frontend_alb_sg_id = data.aws_ssm_parameter.frontend_alb_sg.value
  public_subnet_ids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)
  common_tags = {
    project   = var.project
    env       = var.env
    terraform = "true"
  
  }
  frontend_acm_certificate_arn = data.aws_ssm_parameter.frontend_acm_certificate_arn.value
}