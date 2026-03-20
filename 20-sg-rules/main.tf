resource "aws_security_group_rule" "bastion_internet" {
   
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = "22"
   cidr_blocks = [ local.myip ]
   security_group_id = local.bastionsg_id
}

resource "aws_security_group_rule" "mongodb_bastion" {
   
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = "22"
   source_security_group_id = local.bastionsg_id
   security_group_id = local.mongosg_id
}

resource "aws_security_group_rule" "redis_bastion" {
   
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = "22"
   source_security_group_id = local.bastionsg_id
   security_group_id = local.redissg_id
}

resource "aws_security_group_rule" "mysql_bastion" {
   
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = "22"
   source_security_group_id = local.bastionsg_id
   security_group_id = local.mysqlsg_id
}


resource "aws_security_group_rule" "rabbitmq_bastion" {
   
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = "22"
   source_security_group_id = local.bastionsg_id
   security_group_id = local.rabbitmqsg_id
}

resource "aws_security_group_rule" "mongodb_catalogue" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 27017
   to_port = 27017
   source_security_group_id = local.Cataloguesg_id
   security_group_id = local.mongosg_id
}

resource "aws_security_group_rule" "mongodb_user" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 27017
   to_port = 27017
   source_security_group_id = local.usersg_id
   security_group_id = local.mongosg_id
}

resource "aws_security_group_rule" "redis_user" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 6379
   to_port = 6379
   source_security_group_id = local.usersg_id
   security_group_id = local.redissg_id
  }


resource "aws_security_group_rule" "redis_cart" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 6379
   to_port = 6379
   source_security_group_id = local.cartsg_id
   security_group_id = local.redissg_id
  }

resource "aws_security_group_rule" "mysql_shipping" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 3306 
   to_port = 3306
   source_security_group_id = local.shippingsg_id
   security_group_id = local.mysqlsg_id
  }

resource "aws_security_group_rule" "rabbitmq_payment" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 5672
   to_port = 5672
   source_security_group_id = local.paymentsg_id
   security_group_id = local.rabbitmqsg_id
  }

 resource "aws_security_group_rule" "backend_alb_bastion" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 80
   to_port = 80
   source_security_group_id = local.bastionsg_id
   security_group_id =local.backend_albsg_id
  }


  resource "aws_security_group_rule" "catalogue_backend_alb" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 8080
   to_port = 8080
   source_security_group_id = local.backend_albsg_id
   security_group_id =local.Cataloguesg_id
  }

   resource "aws_security_group_rule" "catalogue_bastion" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = 22
   source_security_group_id = local.bastionsg_id
   security_group_id = local.Cataloguesg_id
  }


   resource "aws_security_group_rule" "frontendalb_public" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 443
   to_port = 443
   cidr_blocks = ["0.0.0.0/0"]
   security_group_id = local.frontend_alb_sg_id
  }