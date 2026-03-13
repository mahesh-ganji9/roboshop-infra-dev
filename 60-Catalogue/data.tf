data "aws_ssm_parameter" "private_subnet_ids" {
   name = "/${var.project}/${var.env}/private_subnet_ids"
}

data "aws_ssm_parameter" "Catalogue_sg_id" {
   name = "/${var.project}/${var.env}/Catalogue_sg_id"
}

data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project}/${var.env}/vpc_id"
}

data "aws_ssm_parameter" "alb_listener_arn" {
  name = "/${var.project}/${var.env}/alb_listener_arn"
}

data "aws_ami" "ami_data" {
  owners      = ["973714476881"]
  most_recent = true


  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}