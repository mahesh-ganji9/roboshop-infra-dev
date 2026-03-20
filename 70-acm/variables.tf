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

variable "domain_name" {
  default = "daws88s.shop"
}

variable "zone_id" {
  default = "Z01154241BNSMMPVQO32W"
}

