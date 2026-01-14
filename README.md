Cloud/DevOps Automation on AWS: Provisioning & Compliance

This repository demonstrates a production-ready approach to Infrastructure as Code (IaC) using Terraform and Configuration Management using Chef, specifically designed to address secure, scalable, and highly available AWS architectures for AutomatedPros.

This project automates the deployment of a secure web environment on AWS. It bridges the gap between foundational infrastructure provisioning and OS-level application configuration.

Core Objectives Addressed:
Infrastructure as Code: Provisioning a custom VPC and networking stack using Terraform.

Configuration Management: Bootstrapping an Amazon Linux 2 instance with Chef principles to ensure consistent software delivery.

Security & Compliance: Implementing least-privilege Security Groups and automated auditing with Chef InSpec.

Cost Optimization: Tagging resources for granular cost analysis and using a destroy-on-idle workflow.

Technologies
Cloud Provider: AWS (VPC, EC2, IGW, Route Tables)

IaC: Terraform v1.0+

Configuration: Bash/Chef Infra Client

Compliance: Chef InSpec

VCS: GitHub

Architecture
Network: A custom VPC (10.0.0.0/16) with a Public Subnet for web traffic and a Private Subnet for future database expansion.

Gateways: Internet Gateway (IGW) attached for public ingress/egress.

Security: A dedicated Security Group allowing inbound traffic only on Port 80 (HTTP) from 0.0.0.0/0.

Compute: A t2.micro EC2 instance running Amazon Linux 2, automatically provisioned with Nginx.
<img width="1365" height="642" alt="ap-ec2" src="https://github.com/user-attachments/assets/6880b36a-ed6a-47a9-863b-7760e36f7c3f" />


Steps to deploy

1. Provision Infrastructure

$ terraform init
$ terraform plan
$ terraform apply -auto-approve

<img width="1365" height="767" alt="ap success" src="https://github.com/user-attachments/assets/7d3fa23f-251a-4608-9d4d-3ffa76fbeb2a" />



2. Automated Configuration
The deployment uses a user_data bootstrap script to:

Update system packages.

Install the Chef Infra Client.

Configure and enable Nginx.
<img width="1365" height="734" alt="ap-website" src="https://github.com/user-attachments/assets/4476ed5f-f627-4e4f-875d-ffd7d374bfa2" />


3. Compliance Audit

<<<<<<< HEAD
To verify the environment against security standards:
=======
To verify the environment against security standards, I used:
>>>>>>> 254650cb636da890d8ec661f6ce2c8d60429f793

inspec exec https://github.com/your-username/nginx-audit -t ssh://ec2-user@98.81.152.48

Cost Optimization & Ownership

To maintain a bias for action and ownership, all resources are tagged with Project: AutomatedPros-Demo.

When testing was complete, I deprovisioned the environment instantly to prevent waste using:

$ terraform destroy -auto-approve

I saved the state file at a remote backend on Terraform cloud
<img width="1365" height="767" alt="ap final" src="https://github.com/user-attachments/assets/a9d07a5e-aa8a-46a4-bee5-c60fcbc619e5" />

