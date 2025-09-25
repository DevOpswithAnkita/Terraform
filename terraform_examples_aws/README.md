# Terraform Examples: EC2 and S3

This repository contains sample Terraform configurations to:

1. Create **10 EC2 instances** in AWS.
2. Create **10 S3 buckets** with unique names (`company-ankita-1`, `company-ankita-2`, ...).

---

## **Files in this repository**

| File | Description |
|------|-------------|
| `providers.tf` | AWS provider configuration |
| `variables.tf` | Input variables for EC2 and S3 resources |
| `main.tf` | EC2 and S3 resource definitions |
| `outputs.tf` | Outputs (EC2 IDs, public IPs, S3 bucket names) |
| `terraform.tfvars` | Variable values (number of instances, bucket names, etc.) |

---

## **Requirements**

- Terraform >= 1.5.x
- AWS account with proper IAM permissions
- AWS CLI configured (or environment variables for access keys)

---

## **How to Use**

1. **Initialize Terraform:**
```bash
terraform init
```
2. **Preview changes:**
```bash
terraform plan
```
3. **Apply configuration:**

```bash
terraform apply -auto-approve
```
4. **Destroy resources (if needed):**

```bash
terraform destroy -auto-approve
```

***Outputs****
- After terraform apply, you will get:
- instance_ids → List of EC2 instance IDs
- public_ips → List of public IPs of EC2 instances
- bucket_names → List of S3 bucket names

****Notes****
- EC2 AMI IDs in terraform.tfvars must be updated according to your AWS region.
- S3 bucket names must be globally unique. If the bucket already exists, Terraform will fail.
- Sensitive information like passwords or keys should not be hard-coded; use environment variables or secret managers.
