locals {
  ami_id = data.aws_ami.ami_data.id
  # public_subnet_id = split(",",data.aws_ssm_parameter.public_subnet_ids.value)[0]
  db_private_subnet_ids = split(",", data.aws_ssm_parameter.db_private_subnet_ids.value)[0]
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