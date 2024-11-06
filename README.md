# Terraform 5SRCC EKS Cluster Project

## Project Requirements
- AWS CLI 
- GNU Coreutils + OpenSSL (Need some bash wizardry at some point)
- (Optionnal) Kubectl (If you want to deploy a "hello-world" app)

## Project Setup
1. First link an existing IAM account on the `5srcc` profile (make sure it has permission for a terraform profile)
```bash
aws configure --profile 5srcc
```
> This uses the aws profile (from aws cli) for authentication to the AWS APIs

2. Then create an s3 bucket. We will store the tfstate in it
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

#### Known issues
- The kubernetes provider might initialize to localhost endpoint : this is due to the EKS resource being not available, making the datasource fail and the provider fallback to localhost; a workaround might be to use the terraform's `-target` flag to apply your terraform to the specific intended resource/module (thus skipping kube provider init)
- The external `oidc_provider_fingerprint` datasource might fail : make sure you have all the necessary requirement for the `thumbprint.sh` script; ie. `awk`, `openssl`, `tac`, `sed`, `bash`; you can test the script by executing it with aws_region as the first arg ie. `./thumbprint.sh eu-west-3`

## Extras
You can patch your local kubeconfig for the remote EKS using the following command :
```bash
# aws eks update-kubeconfig --profile <aws-profile> --name <eks-cluster-name> --region <aws-region>
aws eks update-kubeconfig --profile 5srcc --name eks-cluster --region eu-west-3
```
#### (Optional) Deploy a "hello-world" app
```bash
kubectl apply -f  hello-world-deployment.yaml
```
After deployment you can get the address public URL of the ressource the following way :
```bash
kubectl -n game-2048 get ingresses.networking.k8s.io ingress-2048 
```

## Deployed Examples
### VPC Resource Map (from core-compute module)
![VPC Resource Map](https://github.com/milkshake308/terraform5srcc/blob/master/vpc_resource_map.png?raw=true)
### ELB Resource Map (from hello-world deployment + alb module)
![ELB Resource Map](https://github.com/milkshake308/terraform5srcc/blob/master/elb_resource_map.png?raw=true)