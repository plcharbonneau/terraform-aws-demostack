
resource "aws_route53_record" "hashiui" {
  zone_id = var.zone_id
  name    = "hashiui.${var.namespace}"
  type    = "CNAME"
  records = [aws_instance.workers.0.public_dns]
  ttl     = "300"
}
resource "aws_route53_record" "fabio" {
  zone_id = var.zone_id
  name    = "fabio.${var.namespace}"
  type    = "CNAME"
  records = [aws_alb.fabio.dns_name]
  ttl     = "300"
}
resource "aws_route53_record" "consul" {
  zone_id = var.zone_id
  name    = "consul.${var.namespace}"
  type    = "CNAME"
  records = [aws_alb.consul.dns_name]
  ttl     = "300"
}
resource "aws_route53_record" "nomad" {
  zone_id = var.zone_id
  name    = "nomad.${var.namespace}"
  type    = "CNAME"
  records = [aws_alb.nomad.dns_name]
  ttl     = "300"
}
resource "aws_route53_record" "vault" {
  zone_id = var.zone_id
  name    = "vault.${var.namespace}"
  type    = "CNAME"
  records = [aws_alb.vault.dns_name]
  ttl     = "300"
}

resource "aws_route53_record" "servers" {
  count = var.servers
  zone_id = var.zone_id
  name    = "server-${count.index}.${var.namespace}"
  type    = "CNAME"
  records = ["${element(aws_instance.server.*.public_dns, count.index)}"]
  ttl     = "300"
}

resource "aws_route53_record" "workers" {
  count = var.workers
  zone_id = var.zone_id
  name    = "workers-${count.index}.${var.namespace}"
  type    = "CNAME"
  records = ["${element(aws_instance.workers.*.public_dns, count.index)}"]
  ttl     = "300"
}
