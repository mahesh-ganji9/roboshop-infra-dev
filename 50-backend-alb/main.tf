resource "aws_lb" "test" {
  name               = "${var.project}-${var.env}-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  subnets            =  local.private_subnet_ids
  enable_deletion_protection = false


  tags = merge(local.common_tags,
         {
            Name = "${var.project}-${var.env}-alb"
         }
         )
  
}

resource "aws_lb_listener" "http" {
   load_balancer_arn = aws_lb.test.arn
   port = 80
   protocol = "HTTP"
   default_action {
      type = "fixed-response"
      fixed_response {
          content_type = "text/html"
          message_body = "<h1>Hi, I am from HTTP Backend ALB</h1>"
          status_code  = "200"
      }
   }
}

resource "aws_route53_record" "www" {
   zone_id = var.zone_id
   type = "A"
   name = "*.backend-alb-${var.env}.${var.domain_name}"
   alias {
      evaluate_target_health = true
      name =    aws_lb.test.dns_name
      zone_id = aws_lb.test.zone_id
   }
}