variable "env" {
  default = "dev"
}

variable "project" {
  default = "roboshop"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "tags" {
  type    = map(any)
  default = {}
}





# variable "zone_id" {
#   default = "Z01154241BNSMMPVQO32W"
# }

# variable "domain_name" {
#   default = "daws88s.shop"
# }