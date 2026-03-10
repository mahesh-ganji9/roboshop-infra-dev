locals {
  ami_id = data.aws_ami.ami_data.id
  # public_subnet_id = split(",",data.aws_ssm_parameter.public_subnet_ids.value)[0]
  db_private_subnet_ids = split(",", data.aws_ssm_parameter.db_private_subnet_ids.value)[0]
  mysql_role_name = join("-", [for name in ["${var.project}","${var.env}",mysqlrole]: title(name)])
  mysql_role_policy = join("-", [for name in ["${var.project}","${var.env}",mysqlpolicy]: title(name)])
  mongodbsg_id          = data.aws_ssm_parameter.mongosg.value
  redissg_id            = data.aws_ssm_parameter.redis.value
  mysqlsg_id            = data.aws_ssm_parameter.mysql.value
  rabbitmqsg_id         = data.aws_ssm_parameter.rabbitmq.value
  common_tags = {
    project   = var.project
    env       = var.env
    terraform = "true"
  }
}