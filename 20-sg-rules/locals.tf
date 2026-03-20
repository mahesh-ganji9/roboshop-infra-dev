locals {
    env = "dev"
    project = "roboshop"
    bastion_sg_id = data.aws_ssm_parameter.bastionsg.value
    mongo_sg_id = data.aws_ssm_parameter.mongosg.value
    catalogue_sg_id = data.aws_ssm_parameter.Catalogue.value
    
    myip = "${chomp(data.http.icanhazip.response_body)}/32"
    user_sg_id = data.aws_ssm_parameter.user.value
    redis_sg_id = data.aws_ssm_parameter.redis.value
    cart_sg_id = data.aws_ssm_parameter.cart.value
    mysql_sg_id = data.aws_ssm_parameter.mysql.value
    shipping_sg_id = data.aws_ssm_parameter.shipping.value
    rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq.value
    payment_sg_id = data.aws_ssm_parameter.payment.value
    backend_alb_sg_id = data.aws_ssm_parameter.backend_alb.value
    frontend_alb_sg_id =data.aws_ssm_parameter.frontend_alb.value
    frontend_sg_id = data.aws_ssm_parameter.frontend.value
}