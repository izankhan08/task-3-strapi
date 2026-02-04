# TASK-3
Task: EC2 Provisioning with Terraform & Strapi Deployment

1. Terraform Module Structure

Created a modular Terraform structure using a root module and an EC2 child module.

Separated concerns using main.tf, variables.tf, and outputs.tf at both root and module levels.

2. EC2 Provisioning via Terraform

Provisioned an AWS EC2 instance using Terraform.

Used variables for AMI ID, instance type, and key name to avoid hard-coding.

3. PEM Key Generation & Management

Generated SSH key pair using Terraform tls_private_key.

Registered the public key with AWS using aws_key_pair.

Managed the private key securely via Terraform output marked as sensitive.

No .pem file or secrets stored in the GitHub repository.

4. Strapi Deployment on EC2

Installed Node.js and required dependencies using EC2 user_data.

Deployed and ran Strapi automatically on the EC2 instance.

Strapi is accessible on port 1337 using the EC2 public IP.

5. GitHub Repository & Pull Request

Created a public GitHub repository for the project.

Followed a PR-based workflow by creating a feature branch and raising a Pull Request against main.

6. Loom Video
