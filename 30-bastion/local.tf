locals {
  ami_id = data.aws_ami.ami_data.id
  instance_name = var.instance_name
  public_subnet_id = split(",",data.aws_ssm_parameter.public_subnet_ids.value)[0]
  bastionsg_id = data.aws_ssm_parameter.bastionsg.value
  common_tags = {
        Name = "${var.project}-${var.env}-${var.instance_name}"
        project = var.project
        env = var.env
  }
  ec2_final_tags = merge(var.tags,local.common_tags)
}