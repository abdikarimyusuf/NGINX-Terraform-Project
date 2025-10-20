# ec2.tf

data "aws_ami" "ubuntu" {
    most_recent = true
    owners      = ["099720109477"] # Canonical Ubuntu

  
}

data "aws_vpc" "vpc" {
    default = true
  
}

data "aws_subnets" "subnet" {

    filter {
    name = "vpc-id"
    values = [data.aws_vpc.vpc.id]
    }
  
}

resource "aws_instance" "nginx" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id =  data.aws_subnets.subnet.ids[0]

    security_groups = [aws_security_group.SG.id]

    user_data = file("user_data.sh")
    tags = {
        Name = "nginx-server"
    }
  
}
