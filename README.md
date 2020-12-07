# Packer-project

## prerequisite

* Terraform
* GCP account and service account file (json file)
* Parker

## Install Packer
* [Packer installation link](https://www.packer.io/downloads)

## Service Account
Put the service account path in credential argument of provider configuration:  [credential provider](https://github.com/franck-art/Packer-project/blob/master/main.tf)

## Run packer to install nginx image

```
cd Packer-project/
packer build packer_image.json
```
## Run Terraform with image packer
look at the terraform code
My image packer is called packer-nginx

```
cd Packer-project/
terraform init
terraform plan -out=run.plan
terraform apply run.plan
```

## Verify the installation of nginx
* ssh -i /path/to/your/private/ip  @ip_terraform_instance
* systemctl status nginx
and check that nginx is running

