[
    # AWS Cloud/DevOps Automation: Provisioning & Compliance

This repository demonstrates a production-ready approach to Infrastructure as Code (IaC) using Terraform and Configuration Management using Chef, specifically designed to address secure, scalable, and highly available AWS architectures for AutomatedPros.

Project Overview

This project automates the deployment of a secure web environment on AWS. It bridges the gap between foundational infrastructure provisioning and OS-level application configuration.

Core Objectives Addressed:
Infrastructure as Code: Provisioning a custom VPC and networking stack using Terraform.

Configuration Management: Bootstrapping an Amazon Linux 2 instance with Chef principles to ensure consistent software delivery.

Security & Compliance: Implementing least-privilege Security Groups and automated auditing with Chef InSpec.

Cost Optimization: Tagging resources for granular cost analysis and using a destroy-on-idle workflow.

Tech Stack
Cloud Provider: AWS (VPC, EC2, IGW, Route Tables)

IaC: Terraform v1.0+

Configuration: Bash/Chef Infra Client

Compliance: Chef InSpec

VCS: GitHub

Architecture Detail
Network: A custom VPC (10.0.0.0/16) with a Public Subnet for web traffic and a Private Subnet for future database expansion.

Gateways: Internet Gateway (IGW) attached for public ingress/egress.

Security: A dedicated Security Group allowing inbound traffic only on Port 80 (HTTP) from 0.0.0.0/0.

Compute: A t2.micro EC2 instance running Amazon Linux 2, automatically provisioned with Nginx.

How to Deploy

1. Provision Infrastructure

$ terraform init
$ terraform plan
$ terraform apply -auto-approve


2. Automated Configuration
The deployment uses a user_data bootstrap script to:

Update system packages.

Install the Chef Infra Client.

Configure and enable Nginx.

3. Compliance Audit

To verify the environment against security standards:

inspec exec https://github.com/your-username/nginx-audit -t ssh://ec2-user@98.81.152.48

Cost Optimization & Ownership

To maintain a bias for action and ownership, all resources are tagged with Project: AutomatedPros-Demo. When testing was complete, I deprovisioned the environment instantly to prevent waste using:

$ terraform destroy -auto-approve

]
