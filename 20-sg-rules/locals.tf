locals {
    env = "dev"
    project = "roboshop"
    bastionsg_id = data.aws_ssm_parameter.bastionsg.value
    mongosg_id = data.aws_ssm_parameter.mongosg.value
    Cataloguesg_id = data.aws_ssm_parameter.Catalogue.value
    myip = "${chomp(data.http.icanhazip.response_body)}/32"
    usersg_id = data.aws_ssm_parameter.user.value
    redissg_id = data.aws_ssm_parameter.redis.value
    cartsg_id = data.aws_ssm_parameter.cart.value
    mysqlsg_id = data.aws_ssm_parameter.mysql.value
    shippingsg_id = data.aws_ssm_parameter.shipping.value
    rabbitmqsg_id = data.aws_ssm_parameter.rabbitmq.value
    paymentsg_id = data.aws_ssm_parameter.payment.value
    backend_albsg_id = data.aws_ssm_parameter.backend_alb.value
}