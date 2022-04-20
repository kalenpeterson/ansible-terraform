# Terraform-Ansible Integration
This template is used to call Terraform projects from Ansible Tower.

## Requirements
  * community.general.terraform v 4.2+
    * The included terraform module in Ansible 2.9 is broken for this use-case

## Setup

### Install/Update your collection
```
ansible-galaxy collection install community.general
```

## Terraform Command
```
terraform workspace new TASK1234
terraform init -backend-config="conn_str=postgres://postgres:<PG_PASSWORD>@localhost/terraform_backend?sslmode=disable"

terraform apply -var="docker_container_name=test-01" -auto-approve
terraform destroy -var="docker_container_name=test-01" -auto-approve

terraform apply -var="docker_container_name=test-02" -auto-approve
terraform destroy -var="docker_container_name=test-02" -auto-approve
```


## Create Docker
```
docker run -d \
	--name 'postgres-tf' \
	-e POSTGRES_DB='terraform_backend' \
	-e POSTGRES_PASSWORD='' \
	-v postgres_data:/var/lib/postgresql/data \
	-p 5432:5432 \
	docker.io/postgres:12
```