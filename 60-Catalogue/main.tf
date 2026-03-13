resource "aws_instance" "catalogue" {
  ami                    = local.ami_id
  instance_type          = var.instance_type
  subnet_id              = local.private_subnet_ids
  vpc_security_group_ids = [local.catalogue_sg_id ]
  tags = merge(local.common_tags, {
    Name = "${var.project}-${var.env}-catalogue"}
  )
}

resource "terraform_data" "bootstrap" {
   triggers_replace = [
     aws_instance.catalogue.id
   ]
   connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = aws_instance.catalogue.private_ip
   }

   provisioner "file" {
     source = "bootstrap.sh"
     destination = "/tmp/bootstrap.sh"
   }
#    provisioner "remote-exec" {
#       inline = [ 
#         "chmod +x /tmp/bootstrap.sh",
#         "sudo sh /tmp/bootstrap.sh"
#        ]
#    }
   provisioner "remote-exec" {
      inline = [ 
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh catalogue ${var.env}"
       ]
   }
}

resource "aws_ec2_instance_state" "catalogue_state" {
  instance_id = aws_instance.catalogue.id
  state       = "stopped"
  depends_on = [ terraform_data.bootstrap ]
}

resource "aws_ami_from_instance" "catalogue_ami" {
  name               = "${var.project}-${var.env}-catalogue-ami"
  source_instance_id = aws_instance.catalogue.id

  depends_on = [ aws_ec2_instance_state.catalogue_state ]
    tags = merge(local.common_tags, {
    Name = "${var.project}-${var.env}-catalogue-ami"}
  )
}

resource "aws_lb_target_group" "catalogue_targetgrp" {
  name     = "${var.project}-${var.env}-catalogue-targetgrp"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = local.vpc_id
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 3
    interval = 10
    matcher = "200-299"
    path = "/health"
    port = 8080
    protocol = "HTTP"
    timeout = 2
  }
}


resource "aws_launch_template" "catalogue_template" {
  name = "${var.project}-${var.env}-catalogue"
  image_id = aws_ami_from_instance.catalogue_ami.id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type = var.instance_type
  vpc_security_group_ids = [local.catalogue_sg_id]
  update_default_version = true
  tag_specifications {
    resource_type = "instance"
  
    tags = merge(local.common_tags, {
    Name = "${var.project}-${var.env}-catalogue"}
  )
}
    tag_specifications {
    resource_type = "volume"
  
    tags = merge(local.common_tags, {
    Name = "${var.project}-${var.env}-catalogue"}
  )
}
}


resource "aws_autoscaling_group" "catalogue" {
  name                      = "${var.project}-${var.env}-catalogue"
  max_size                  = 10
  min_size                  = 1
  health_check_grace_period = 120
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = false
  launch_template {
    id = aws_launch_template.catalogue_template.id 
    version = "$Latest"
  }  
  vpc_zone_identifier       = [local.private_subnet_ids]
  target_group_arns = [ aws_lb_target_group.catalogue_targetgrp.arn ]
  tag {
     key = "Name"
     value = "${var.project}-${var.env}-catalogue"
     propagate_at_launch = false
  }

}

resource "aws_autoscaling_policy" "catalogue_policy" {
   autoscaling_group_name = aws_autoscaling_group.catalogue.name
   name = "${var.project}-${var.env}-catalogue-policy"
   policy_type = "TargetTrackingScaling"
   estimated_instance_warmup = 120
   target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
      target_value = 70.0
   }
}

resource "aws_lb_listener_rule" "catalogue_lb_rule" {
   priority = 10
   listener_arn = local.alb_listener_arn
   action {
     type = "forward"
     target_group_arn = aws_lb_target_group.catalogue_targetgrp.arn
   }
   condition {
     host_header {
        values = [ "catalogue.backend-alb-${var.env}.${var.domain_name}" ]
     }
   }
}