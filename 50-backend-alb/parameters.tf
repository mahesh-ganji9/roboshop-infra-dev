resource "aws_ssm_parameter" "alb_listener_arn" {
   name = "/${var.project}/${var.env}/alb_listener_arn"
   type = "String"
   value = aws_lb_listener.http.arn
}