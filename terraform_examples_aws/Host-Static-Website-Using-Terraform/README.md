cat <<EOT > README.md
# Static Website Hosting on AWS S3 using Terraform

This project demonstrates how to host a static website on AWS S3 using Terraform. It creates an S3 bucket, configures it for website hosting, sets public access, and uploads a test HTML file.

---

## **Project Structure**

.
├── main.tf                # Terraform configuration for S3 bucket and resources
├── outputs.tf             # Outputs (e.g., website URL)
├── test.html  # Sample HTML file for testing 
└── README.md

---

## **Prerequisites**

- Terraform installed (v1.5+ recommended)
- AWS CLI configured with an IAM user that has:
  - s3:CreateBucket
  - s3:PutBucketPolicy
  - s3:PutObject
  - s3:GetObject
  - s3:ListBucket
- Optional: Git for version control

---

## **Setup Instructions**

1. **Clone the repository** (if using GitHub):
\`\`\`
git clone (https://github.com/DevOpswithAnkita/Terraform.git)
cd terraform_examples_aws/Host-Static-Website-Using-Terraform
\`\`\`

2. **Initialize Terraform**:
\`\`\`
terraform init
\`\`\`

3. **Plan the deployment**:
\`\`\`
terraform plan
\`\`\`

4. **Apply the deployment**:
\`\`\`
terraform apply
\`\`\`

5. **View the website URL**:
- If you have an outputs.tf file configured, run:
\`\`\`
terraform output
\`\`\`
- Open the URL in your browser.
     https://devopswithankita.s3-website-us-east-1.amazonaws.com/
---


