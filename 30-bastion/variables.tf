variable "env" {
  default = "dev"
}

variable "project" {
  default = "roboshop"
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "instance_name" {
  type = string
  default = "bastion"
}