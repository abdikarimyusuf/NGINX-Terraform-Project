variable "vpc_id" {
    description = "vpc id "
    type = string
}


variable "domain_name" {
    description = "the main domain name"
    type = string
  
}



variable "instance_type" {
  description = "EC2 instance type"
  default     = "t4g.small"
}

variable "key_name" {
    description = "key_pair"
    type = string 
}

