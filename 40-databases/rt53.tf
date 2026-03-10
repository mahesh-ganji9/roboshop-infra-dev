#mongodb-dev.daws88s.shop

resource "aws_route53_record" "mongodb_record" {
  zone_id         = var.zone_id
  records         = [aws_instance.mongodb.private_ip]
  type            = "A"
  ttl             = 1
  allow_overwrite = true
  name            = "mongodb-${var.env}.${var.domain_name}"
}

resource "aws_route53_record" "redis_record" {
  zone_id         = var.zone_id
  records         = [aws_instance.redis.private_ip]
  type            = "A"
  ttl             = 1
  allow_overwrite = true
  name            = "redis-${var.env}.${var.domain_name}"
}

resource "aws_route53_record" "mysql_record" {
  zone_id         = var.zone_id
  records         = [aws_instance.mysql.private_ip]
  type            = "A"
  ttl             = 1
  allow_overwrite = true
  name            = "mysql-${var.env}.${var.domain_name}"
}

resource "aws_route53_record" "rabbitmq_record" {
  zone_id         = var.zone_id
  records         = [aws_instance.rabbitmq.private_ip]
  type            = "A"
  ttl             = 1
  allow_overwrite = true
  name            = "rabbitmq-${var.env}.${var.domain_name}"
}