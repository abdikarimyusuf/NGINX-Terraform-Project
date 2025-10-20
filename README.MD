# 🚀 NGINX Terraform Lab & AWS Infrastructure

Deploy an **EC2 instance running NGINX**, configure an **ALB**, secure it with **ACM TLS**, and manage **DNS via Route 53** using Terraform.

---

## 📦 Project Structure

- `main.tf`: AWS provider configuration & backend  
- `sg.tf`: Security Groups for EC2 & ALB  
- `ec2.tf`: EC2 instance setup and `user_data` for NGINX  
- `alb.tf`: Application Load Balancer & Target Group  
- `acm.tf`: ACM Certificate creation & validation  
- `route53.tf`: Route 53 DNS record setup  
- `variables.tf`: Input variables  
- `outputs.tf`: Terraform outputs  
- `terraform.tfvars`: Variable values like `domain_name` & `key_name`  

Custom NGINX landing page served on EC2 (`/var/www/html/index.nginx-debian.html`)  
Health check configured for ALB target group  
Automatic DNS & HTTPS provisioning  

---

## 🛠️ Deployment & Verification

**Initialize Terraform**
terraform init

text

**Validate Configuration**
terraform validate

text

**Plan Deployment**
terraform plan -var-file="terraform.tfvars"

text

**Apply Deployment**
terraform apply -var-file="terraform.tfvars"

text

_Outcome: EC2 instance, ALB, Security Groups, ACM certificate, and DNS record are created._

---

**Customize your NGINX landing page:**
sudo nano /var/www/html/index.nginx-debian.html

text
_Health check: ALB routes traffic only to healthy EC2 instances._

_Confirm DNS: Ensure the Route 53 record points to your ALB, and HTTPS is active._

---

**Verification**

_Check EC2 instance:_
ssh -i <your-key>.pem ubuntu@<ec2-public-ip>
curl http://localhost

text

_Check ALB health:_
aws elbv2 describe-target-health --target-group-arn <target-group-arn>

text

_Access your website:_
- http://nginx.abdikarim.co.uk
- https://nginx.abdikarim.co.uk

---

## 🏆 Key Learnings

- Separate infrastructure & app configuration: Ensures dependencies are ready before workloads.
- ACM validation requires DNS control: Must create Route 53 record or point NS from external registrar.
- Security Groups matter: ALB must have access to EC2; EC2 allows ALB traffic on port 80.
- Instance type & AMI architecture must match (x86_64 vs arm64).
- Customize NGINX content via user_data or directly in /var/www/html.
- Enjoy your automated, secure NGINX deployment on AWS!

---

## 🌟 Author

**Abdikarim Yusuf**  
DevOps Enthusiast | Cloud Learner | Automation Lover  
[LinkedIn](https://www.linkedin.com/in/abdikarim-yusuf-2177b7185/) | [GitHub](https://github.com/abdikarimyusuf)