# alb.tf

# Create the ALB

resource "aws_lb" "nginx_alb" {
    name = "nginx-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.SG.id]
    subnets = toset(data.aws_subnets.subnet.ids)
    
}

resource "aws_lb_target_group" "nginx_tg" {
    name = "nginx-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = data.aws_vpc.vpc.id
    target_type = "instance"
  
}

resource "aws_lb_target_group_attachment" "nginx_tg_att" {
    target_group_arn = aws_lb_target_group.nginx_tg.arn
    target_id = aws_instance.nginx.id
    port = 80
  
}
resource "aws_lb_listener" "lb_lis" {
    load_balancer_arn = aws_lb.nginx_alb.arn
    port = 443
    protocol = "HTTPS"
    ssl_policy        = "ELBSecurityPolicy-2016-08"
    certificate_arn = aws_acm_certificate_validation.nginx_cert_validation.certificate_arn

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.nginx_tg.arn
    }

    #



  
}

 #Listener for HTTP → redirect to HTTPS
resource "aws_lb_listener" "http_https" {
    load_balancer_arn = aws_lb.nginx_alb.arn
    port = 80
    protocol = "HTTP"

    default_action {
      type = "redirect"
      redirect {
        port = "443"
        protocol = "HTTPS"
        status_code = "HTTP_301"
      }
    }

  
}