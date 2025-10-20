# security-group.tf


resource "aws_security_group" "SG" {
    name = "nginx-sg"
     description = "Allow HTTP, HTTPS, SSH"
     vpc_id = data.aws_vpc.vpc.id


   ingress {

    description = "allow http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

}

ingress {
    description = "allow https"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

}

ingress {
    description = "allow ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

egress {
  description = "Allow all outbound"
  from_port   = 0
  to_port     = 0 #all ports
  protocol    = "-1" #all protocols
  cidr_blocks = ["0.0.0.0/0"]
}

tags = {
    Name = "nginx-sg"
  }

}



