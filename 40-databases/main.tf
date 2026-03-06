resource "aws_instance" "mongodb" {
  ami                    = local.ami_id
  instance_type          = var.instance_type
  subnet_id              = local.db_private_subnet_ids
  vpc_security_group_ids = local.mongodbsg_id
  tags = merge(local.common_tags, {
    Name = "${var.project}-${var.env}-mongodb" }
  )
}


# resource "aws_instance" "redis" {
#   ami                    = local.ami_id
#   instance_type          = var.instance_type
#   subnet_id              = local.db_private_subnet_ids
#   vpc_security_group_ids = local.redissg_id
#   tags = merge(local.common_tags, {
#     Name = "${var.project}-${var.env}-redis" }
#   )
# }

# resource "aws_instance" "mysql" {
#   ami                    = local.ami_id
#   instance_type          = var.instance_type
#   subnet_id              = local.db_private_subnet_ids
#   vpc_security_group_ids = local.mysqlsg_id
#   tags = merge(local.common_tags, {
#     Name = "${var.project}-${var.env}-mysql" }
#   )
# }

# resource "aws_instance" "rabbitmq" {
#   ami                    = local.ami_id
#   instance_type          = var.instance_type
#   subnet_id              = local.db_private_subnet_ids
#   vpc_security_group_ids = local.rabbitmqsg_id
#   tags = merge(local.common_tags, {
#     Name = "${var.project}-${var.env}-rabbitmq" }
#   )
# } 