variable "project" {
  default = "roboshop"
}

variable "env" {
  default = "dev"
}

variable "sg_name" {
  type = list(any)
  default = [
    #Database
    "mongodb", "redis", "mysql", "rabbitmq",
    #Backend
    "catalogue", "user", "cart", "shipping", "payment",
    #Frontend
    "frontend",
    #ALB
    "frontend_alb", "backend_alb", "bastion"
  ]
}