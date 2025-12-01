🚀 AWS Cloud Infrastructure & Automation Project (Terraform)

A complete 7-Day Production-Ready AWS Infrastructure Project built using Terraform, covering:

✔️ VPC
✔️ EC2
✔️ S3
✔️ RDS
✔️ CloudWatch Monitoring
✔️ Terraform Modules
✔️ Automation & IaC Best Practices

📌 Project Overview

This project simulates a real-world AWS infrastructure using Terraform modules.
Everything is built from scratch and fully automated, making it an ideal DevOps / Cloud project for resumes and interviews.

🏗️ Architecture Diagram (Conceptual)
                ┌──────────────────────────┐
                │        AWS VPC           │
                │   (10.0.0.0/16)          │
                └──────────┬───────────────┘
                       Public + Private
                     Subnets in 2 AZs
     ┌──────────────────┴──────────────────┐
     │                                      │
 Public Subnet                         Private Subnet
     │                                      │
┌──────────────┐                     ┌─────────────────┐
│   EC2 Web    │  ← SG allows        │   RDS MySQL     │
│   Server     │  HTTP/SSH traffic   │   Database      │
└──────────────┘                     └─────────────────┘
       │                                       │
       ▼                                       ▼
  User-data runs                         DB Subnet Group
  Apache server                          No public access
       │                                       │
       └──────────────┬────────────────────────┘
                      │
                ┌─────────────┐
                │    S3        │
                │ Versioning   │
                │ Lifecycle    │
                └─────────────┘

        CloudWatch:
        - EC2 CPU Alarm
        - RDS Storage Alarm
        - Dashboard

🗂️ Folder Structure
AWS-Project/
│── main.tf
│── provider.tf
│── variables.tf
│── userdata.sh
│── modules/
│   ├── VPC/
│   │    ├── main.tf
│   │    ├── variables.tf
│   │    └── outputs.tf
│   ├── Ec2/
│   │    ├── main.tf
│   │    ├── variables.tf
│   │    └── outputs.tf
│   ├── S3/
│   │    ├── main.tf
│   │    ├── variables.tf
│   │    └── outputs.tf
│   ├── RDS/
│   │    ├── main.tf
│   │    ├── variables.tf
│   │    └── outputs.tf
│   └── Cloudwatch/
│        ├── main.tf
│        ├── variables.tf
│        └── outputs.tf

🧩 Terraform Modules Used
🔹 VPC Module

Creates:

VPC

Public subnets

Private subnets

Route tables

Internet Gateway

NAT (optional)

🔹 EC2 Module

Features:

EC2 instance

SSH key pair

Security group

Automated Apache Web Server (via user-data)

🔹 S3 Module

Includes:

S3 bucket

Versioning

Lifecycle management

Secure access rules

🔹 RDS Module

Creates:

MySQL DB instance

Private subnet placement

DB subnet group

RDS Security group

Automated backups

🔹 CloudWatch Module

Adds:

EC2 CPU alarm

RDS storage alarm

CloudWatch Dashboard

⚙️ How to Run Terraform
1️⃣ Initialize Terraform
terraform init

2️⃣ Preview Changes
terraform plan

3️⃣ Apply Infrastructure
terraform apply -auto-approve

4️⃣ Destroy Everything
terraform destroy -auto-approve

🛠️ Technologies Used

Terraform

AWS Cloud

EC2, VPC, Subnets

RDS (MySQL)

S3 Storage

CloudWatch

IAM

Security Groups

Shell Scripting

🎯 Purpose of This Project

✔️ Build real-world AWS architecture
✔️ Learn Infrastructure as Code (IaC)
✔️ Create reusable Terraform modules
✔️ Practice DevOps workflows
✔️ Deploy a production-style cloud environment
✔️ Add a strong project to GitHub & your Resume

📘 Future Improvements

Add Application Load Balancer (ALB)

Auto Scaling Group (ASG)

Remote Backend (S3 + DynamoDB)

Jenkins / GitHub Actions CI-CD pipeline

HTTPS with ACM + ALB

👨‍💻 Author

Ramkr – AWS | Terraform | DevOps Learner
Building real-world cloud automation projects.

⭐ Support

If you like this project, please ⭐ the repo.
It helps more people discover it!
