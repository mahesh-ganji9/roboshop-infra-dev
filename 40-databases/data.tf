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

data "aws_ssm_parameter" "db_private_subnet_ids" {
  name = "/${var.project}/${var.env}/db_private_subnet_ids"
}

data "aws_ssm_parameter" "mongosg" {
  name = "/${var.project}/${var.env}/mongodb_sg_id"
}

data "aws_ssm_parameter" "redis" {
  name = "/${var.project}/${var.env}/redis_sg_id"
}

data "aws_ssm_parameter" "mysql" {
  name = "/${var.project}/${var.env}/mysql_sg_id"
}

data "aws_ssm_parameter" "rabbitmq" {
  name = "/${var.project}/${var.env}/rabbitmq_sg_id"
}
