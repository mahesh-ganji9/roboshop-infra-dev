locals {
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  ami_id = data.aws_ami.ami_data.id
  catalogue_sg_id = data.aws_ssm_parameter.Catalogue_sg_id.value
  private_subnet_ids = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
  common_tags = {
    project   = var.project
    env       = var.env
    terraform = "true"
    }
}