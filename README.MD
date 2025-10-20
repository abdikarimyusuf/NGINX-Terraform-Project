# 🚀 NGINX Terraform Lab & AWS Infrastructure

Deploy an EC2 instance running **NGINX**, configure **ALB**, secure it with **ACM TLS**, and manage **DNS via Route53** using Terraform.

---

## 📦 Project Structure

### Phase 1: Infrastructure

- `main.tf`: AWS provider configuration & backend  
- `vpc.tf` *(optional)*: Networking (VPC, subnets, IGW)  
- `sg.tf`: Security Groups for EC2 & ALB  
- `ec2.tf`: EC2 instance setup and user_data for NGINX  
- `alb.tf`: Application Load Balancer & Target Group  
- `acm.tf`: ACM Certificate creation & validation  
- `route53.tf`: Route 53 DNS record setup  
- `variables.tf`: Input variables  
- `outputs.tf`: Terraform outputs  
- `terraform.tfvars`: Variable values like domain_name & key_name  

### Phase 2: Application Deployment

- NGINX content served on EC2 (`/var/www/html/index.nginx-debian.html`)  
- Health check configuration for ALB target group  
- Automatic DNS & HTTPS provisioning  

---

## ⚠️ Initial Problems

- EC2 not reachable via SSH  
- ACM validation errors  
- ALB → EC2 traffic blocked  
- Subnet/VPC filter issues  

> **Reason:** Resource dependencies and configuration mismatches (key pairs, SG rules, AMI/instance type).

---

## 🛠️ Solution: Step-by-Step Deployment

### Phase 1 – Infrastructure

1. **Prepare Terraform Variables:**  
   Edit `terraform.tfvars` with your domain and key pair:

   ```hcl
   domain_name = "abdikarim.co.uk"
   key_name    = "your-aws-key-name"
Initialize Terraform:

bash
Copy code
terraform init
Validate Configuration:

bash
Copy code
terraform validate
Plan Deployment:

bash
Copy code
terraform plan -var-file="terraform.tfvars"
Apply Deployment:

bash
Copy code
terraform apply -var-file="terraform.tfvars"
Outcome: EC2 instance, ALB, Security Groups, ACM certificate, and DNS record are created.

Phase 2 – Application & NGINX Page
Customize your NGINX landing page:

bash
Copy code
sudo nano /var/www/html/index.nginx-debian.html
Health check ensures ALB routes traffic only to healthy EC2 instances

Confirm DNS record points to ALB, and HTTPS is active

✅ Verification
Check EC2 instance:

bash
Copy code
ssh -i <your-key>.pem ubuntu@<ec2-public-ip>
curl http://localhost
Check ALB:

bash
Copy code
aws elbv2 describe-target-health --target-group-arn <target-group-arn>
Access the website:

arduino
Copy code
http://nginx.abdikarim.co.uk
https://nginx.abdikarim.co.uk
🏆 Key Learnings
Separate infrastructure & app configuration: Ensures dependencies are ready before workloads.

ACM validation requires DNS control: Must create Route53 record or point NS from external registrar.

Security Groups matter: ALB must have access to EC2; EC2 allows ALB traffic on port 80.

Instance type & AMI architecture must match (x86_64 vs arm64).

Customize NGINX content via user_data or directly in /var/www/html.

Enjoy your automated, secure NGINX deployment on AWS!

🌟 Author
Abdikarim Yusuf
DevOps Enthusiast | Cloud Learner | Automation Lover
LinkedIn | GitHub