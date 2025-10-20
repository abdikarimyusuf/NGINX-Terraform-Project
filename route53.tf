# route53.tf

resource "aws_route53_record" "nginx_dns" {
    zone_id = data.aws_route53_zone.main.zone_id
    name = var.domain_name
    type = "A"
    alias {
        name = aws_lb.nginx_alb.dns_name
        zone_id = aws_lb.nginx_alb.zone_id
        evaluate_target_health = true
      
    }
  
}