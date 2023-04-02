This module is to create base infra for Kubernetes deployment on AWS.

Local development:

1. Install Terraform.
2. Install aws cli.
3. Setup AWS account and create an IAM user.
4. Create an S3 bucket for state file.
5. Run aws configure and provide credentials of the user you just created. 
6. Clone this repo.
7. Edit backend.tf, enter the value of S3 bucket and region.
8. Run below mentioned command:
   a. terraform init -input=false
   b. terraform plan -out tfapply
   c. terraform apply -auto-approve tfapply


Circle Execution:

1. Push the code to github.com.
2. Setup Project on app.circleci.com.
3. Setup Environment variables for AWS in the project.

Terraform documenatation:

terraform-docs markdown --header-from terraform.md . >> README.md