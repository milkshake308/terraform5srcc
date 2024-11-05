# Terraform 5SRCC EKS Cluster Project

## Setup
1. First configure a IAM account on the 5srcc profile name (make sure it has permission for a terraform profile)
```bash
aws configure --profile 5srcc
```
> This uses the aws profile (from aws cli) for authentication to the AWS APIs

2. Then create an s3 bucket, this will allow us to store the tfstate in (if it does not exists already)
```bash
# aws s3api create-bucket --bucket <your-tf-state-bucket-name> --region <your-region> --create-bucket-configuration LocationConstraint=<your-region>
aws s3api create-bucket --bucket terraform-5srcc-grp1 --region eu-west-3 --create-bucket-configuration LocationConstraint=eu-west-3
```
> ⚠️ Make sure to edit the `main.tf` file if you plan to choose another region or bucket name
3. Init the terraform project
```bash
terraform init
```
Happy `terraform apply` :)

## Setup kubectl & hello-world deployment
> Requires kubectl to be installed !
1. First patch your local kubeconfig with the remote EKS credentials
```bash
# aws eks update-kubeconfig --profile <aws-profile> --name <eks-cluster-name> --region <aws-region>
aws eks update-kubeconfig --profile 5srcc --name eks-cluster --region eu-west-3
```
2. (Optional) deploy a "hello-world" app
```bash
kubectl apply -f  hello-world-deployment.yaml
```
