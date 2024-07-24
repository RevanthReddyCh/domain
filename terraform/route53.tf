provider "aws" {
    region = "us-east-1"

}
data "aws_route53_zone" "revanthreddych" {
  name = "revanthreddych.com"  # Replace with the domain name of your hosted zone
}

output "zone_id" {
  value = data.aws_route53_zone.revanthreddych.zone_id
}




resource "aws_route53_record" "test" {
  zone_id = data.aws_route53_zone.revanthreddych.zone_id # Replace with your Route 53 hosted zone ID
  name    = "test.revanthreddych.com"   # Replace with the domain name to update
  type    = "A"             # Replace with the record type (A, CNAME, MX, etc.)
  ttl     = 300             # Replace with the TTL value in seconds

  records = ["44.217.42.56"]     # Replace with the new record value(s)
}

resource "aws_route53_record" "sai" {
  zone_id = data.aws_route53_zone.revanthreddych.zone_id # Replace with your Route 53 hosted zone ID
  name    = "sai.revanthreddych.com"   # Replace with the domain name to update
  type    = "A"             # Replace with the record type (A, CNAME, MX, etc.)
  ttl     = 300             # Replace with the TTL value in seconds

  records = ["44.217.42.56"]     # Replace with the new record value(s)
}

resource "aws_route53_record" "auto" {
  zone_id = data.aws_route53_zone.revanthreddych.zone_id # Replace with your Route 53 hosted zone ID
  name    = "auto.revanthreddych.com"   # Replace with the domain name to update
  type    = "A"             # Replace with the record type (A, CNAME, MX, etc.)
  ttl     = 300             # Replace with the TTL value in seconds

  records = ["44.217.42.56"]     # Replace with the new record value(s)
}