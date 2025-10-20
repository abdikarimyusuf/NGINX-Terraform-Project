# acm.tf

resource "aws_acm_certificate" "nginx_acm" {
    domain_name = var.domain_name
    validation_method = "DNS"

    lifecycle {

        create_before_destroy = true
      
    }
    tags = {
    Name = "nginx-cert"
  }
  
}

# DNS validation for ACM via Route53

resource "aws_route53_record" "validation_rec" {
    name = tolist(aws_acm_certificate.nginx_acm.domain_validation_options)[0].resource_record_name
    type = tolist(aws_acm_certificate.nginx_acm.domain_validation_options)[0].resource_record_type
    zone_id = data.aws_route53_zone.main.zone_id
    records = [tolist(aws_acm_certificate.nginx_acm.domain_validation_options)[0].resource_record_value]
    ttl = 60
    depends_on = [aws_acm_certificate.nginx_acm]
}

# Validate the certificate

resource "aws_acm_certificate_validation" "nginx_cert_validation" {
    certificate_arn = aws_acm_certificate.nginx_acm.arn
    validation_record_fqdns = [aws_route53_record.validation_rec.fqdn]
  
}

