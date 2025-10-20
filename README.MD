# 🌐 NGINX Terraform Project - Abdikarim's Lab

Welcome to my **NGINX on AWS Terraform Project**! This project demonstrates how to provision an **EC2 instance**, run **NGINX**, configure an **Application Load Balancer (ALB)**, secure it with **HTTPS using ACM**, and manage **DNS with Route 53** — all automated with **Terraform**.  

---

## 🛠 Project Overview

- **EC2 Instance:** Ubuntu server running NGINX
- **Load Balancer:** Application Load Balancer (ALB) distributing traffic
- **Security:** Custom Security Group allowing HTTP, HTTPS, and SSH
- **Domain:** `abdikarim.co.uk` (subdomain: `nginx.abdikarim.co.uk`)
- **HTTPS:** ACM certificate for secure access
- **Infrastructure as Code:** Terraform scripts for automation

---

## 📂 Project Structure

```text
nginx-terraform-lab/
│
├─ main.tf             # Provider configuration & backend
├─ ec2.tf              # EC2 instance and user_data
├─ alb.tf              # Application Load Balancer & Target Group
├─ sg.tf               # Security Group for EC2 & ALB
├─ acm.tf              # ACM Certificate & Validation
├─ route53.tf          # Route 53 DNS A record
├─ terraform.tfvars    # Variables like domain_name, key_name, etc.
├─ variables.tf        # Variable declarations
└─ outputs.tf          # Outputs like ALB DNS
⚡ Features
Custom NGINX landing page hosted on the EC2 instance

Health checks configured on ALB to monitor EC2 instance

Security Group shared between ALB and EC2

Automatic Route 53 A record creation for your subdomain

HTTPS enabled via ACM for secure connection

🚀 Deployment Steps
Follow these steps to deploy the project:

Clone the repository:

bash
Copy code
git clone <your-repo-url>
cd nginx-terraform-lab
Edit terraform.tfvars with your variables:

h
Copy code
domain_name = "abdikarim.co.uk"
key_name    = "your-aws-key-name"
Initialize Terraform:

bash
Copy code
terraform init
Validate configuration:

bash
Copy code
terraform validate
Plan the deployment:

bash
Copy code
terraform plan -var-file="terraform.tfvars"
Apply the deployment:

bash
Copy code
terraform apply -var-file="terraform.tfvars"
Access Your NGINX Page:

Visit http://nginx.abdikarim.co.uk

HTTPS version will work after ACM certificate validation

🔐 Notes
Ensure your AWS key pair exists and is referenced in terraform.tfvars.

Security Group allows traffic from ALB → EC2 on port 80.

NGINX content can be customized via /var/www/html/index.nginx-debian.html.

You can automate HTML page deployment using user_data in Terraform.