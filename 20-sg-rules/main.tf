#Bastion 

resource "aws_security_group_rule" "bastion_internet" {
   
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = "22"
   cidr_blocks = [ local.myip ]
   security_group_id = local.bastion_sg_id
}
#MongoDB Security Rules

resource "aws_security_group_rule" "mongodb_catalogue" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 27017
   to_port = 27017
   source_security_group_id = local.catalogue_sg_id
   security_group_id = local.mongo_sg_id
}

resource "aws_security_group_rule" "mongodb_user" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 27017
   to_port = 27017
   source_security_group_id = local.user_sg_id
   security_group_id = local.mongo_sg_id
}

resource "aws_security_group_rule" "mongodb_bastion" {
   
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = "22"
   source_security_group_id = local.bastion_sg_id
   security_group_id = local.mongo_sg_id
}

#Redis Security Rules

resource "aws_security_group_rule" "redis_bastion" {
   
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = "22"
   source_security_group_id = local.bastion_sg_id
   security_group_id = local.redis_sg_id
}


resource "aws_security_group_rule" "redis_user" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 6379
   to_port = 6379
   source_security_group_id = local.user_sg_id
   security_group_id = local.redis_sg_id
  }


resource "aws_security_group_rule" "redis_cart" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 6379
   to_port = 6379
   source_security_group_id = local.cart_sg_id
   security_group_id = local.redis_sg_id
  }

# Mysql security rules

resource "aws_security_group_rule" "mysql_bastion" {
   
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = "22"
   source_security_group_id = local.bastion_sg_id
   security_group_id = local.mysql_sg_id
}

resource "aws_security_group_rule" "mysql_shipping" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 3306 
   to_port = 3306
   source_security_group_id = local.shipping_sg_id
   security_group_id = local.mysql_sg_id
  }

# RabbitMQ Security Rules

resource "aws_security_group_rule" "rabbitmq_bastion" {
   
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = "22"
   source_security_group_id = local.bastion_sg_id
   security_group_id = local.rabbitmq_sg_id
}

resource "aws_security_group_rule" "rabbitmq_payment" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 5672
   to_port = 5672
   source_security_group_id = local.payment_sg_id
   security_group_id = local.rabbitmq_sg_id
  }

 
#catalogue to backend alb rules

  resource "aws_security_group_rule" "catalogue_backend_alb" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 8080
   to_port = 8080
   source_security_group_id = local.backend_alb_sg_id
   security_group_id =local.catalogue_sg_id
  }

   resource "aws_security_group_rule" "catalogue_bastion" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = 22
   source_security_group_id = local.bastion_sg_id
   security_group_id = local.catalogue_sg_id
  }

 #user  to backend alb rules

 
  resource "aws_security_group_rule" "user_backend_alb" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 80
   to_port = 80
   source_security_group_id = local.backend_alb_sg_id
   security_group_id =local.user_sg_id
  }

   resource "aws_security_group_rule" "user_bastion" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = 22
   source_security_group_id = local.bastion_sg_id
   security_group_id = local.user_sg_id
   }


#cart  to backend alb rules

 
  resource "aws_security_group_rule" "cart_backend_alb" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 80
   to_port = 80
   source_security_group_id = local.backend_alb_sg_id
   security_group_id =local.cart_sg_id
  }

   resource "aws_security_group_rule" "cart_bastion" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = 22
   source_security_group_id = local.bastion_sg_id
   security_group_id = local.cart_sg_id
   }

#Shipping

 
  resource "aws_security_group_rule" "shipping_backend_alb" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 80
   to_port = 80
   source_security_group_id = local.backend_alb_sg_id
   security_group_id =local.shipping_sg_id
  }

   resource "aws_security_group_rule" "shipping_bastion" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = 22
   source_security_group_id = local.bastion_sg_id
   security_group_id = local.shipping_sg_id
   }


#payment  

 
  resource "aws_security_group_rule" "payment_backend_alb" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 80
   to_port = 80
   source_security_group_id = local.backend_alb_sg_id
   security_group_id =local.payment_sg_id
  }

   resource "aws_security_group_rule" "payment_bastion" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = 22
   source_security_group_id = local.bastion_sg_id
   security_group_id = local.payment_sg_id
   }

# frontend

  resource "aws_security_group_rule" "frontend_bastion" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = 22
   source_security_group_id = local.bastion_sg_id
   security_group_id =local.frontend_sg_id
  }

   resource "aws_security_group_rule" "frontend_frontend_alb" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 22
   to_port = 22
   source_security_group_id = local.frontend_alb_sg_id
   security_group_id = local.frontend_sg_id
   }


   #Backend

   resource "aws_security_group_rule" "backendalb_shipping" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 80
   to_port = 80
   source_security_group_id = local.shipping_sg_id
   security_group_id = local.backend_alb_sg_id
   }

   resource "aws_security_group_rule" "backendalb_payment" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 80
   to_port = 80
   source_security_group_id = local.payment_sg_id
   security_group_id = local.backend_alb_sg_id
   }

   resource "aws_security_group_rule" "backendalb_cart" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 80
   to_port = 80
   source_security_group_id = local.cart_sg_id
   security_group_id = local.backend_alb_sg_id
   }

   resource "aws_security_group_rule" "backendalb_user" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 80
   to_port = 80
   source_security_group_id = local.user_sg_id
   security_group_id = local.backend_alb_sg_id
   }

   resource "aws_security_group_rule" "backendalb_catalogue" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 80
   to_port = 80
   source_security_group_id = local.catalogue_sg_id
   security_group_id = local.backend_alb_sg_id
   }


   resource "aws_security_group_rule" "frontendalb_public" {
   type = "ingress" 
   protocol = "tcp"
   from_port = 443
   to_port = 443
   cidr_blocks = ["0.0.0.0/0"]
   security_group_id = local.frontend_alb_sg_id
  }