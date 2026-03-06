variable "project" {
  default = "roboshop"
}

variable "env" {
  default = "dev"
}

variable "sg_name" {
  type = list 
  default = [
      #Database
      "mongodb", "redis" , "mysql" , "rabbitmq",
      #Backend
      "Catalogue","user", "cart" ,"shipping", "payment",
      #Frontend
      "frontend",
      #ALB
      "frontend_alb", "backend_alb" ,"bastion"
  ]
}