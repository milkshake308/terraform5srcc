# Terraform 5SRCC EKS Cluster Project

## Setup
1. First make sure you have create an IAM account with enough permission and that it is setup on the profile named 5srcc :
```bash
aws configure --profile 5srcc
```
> This uses the aws profile (from aws cli) for authentication to the AWS APIs

2. Then create an s3 bucket, this will allow us to store the tfstate in
```bash
# aws s3api create-bucket --bucket <your-tf-state-bucket-name> --region <your-region> --create-bucket-configuration LocationConstraint=<your-region>
aws s3api create-bucket --bucket terraform-5srcc-grp1 --region eu-west-3 --create-bucket-configuration LocationConstraint=eu-west-3
```
> ⚠️ Make sure to edit the `main.tf` file if you plan to choose another region or bucket name

Happy `terraform apply` :)
