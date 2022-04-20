# AWX-Terraform Runner
This template is used to call Terraform projects from Ansible Tower.

## Contents
  * ansible-wrapper: ansible wrapper code to run AWX or local TF projects
    * awx-run-terraform.yaml: Playbook to create Job Template with
	* awx-tf-pg-credential.yaml: Template for PostgreSQL AWX Credential Type
  * tf-projects: terraform projects to run
    * deploy-docker-container: Manages the deploy/destroy of a docker container


## Requirements
  * community.general.terraform v 4.2+
    * The included terraform module in Ansible 2.9 is broken for this use-case
  * A Postgres DB to manage remote state/workspaces
    * You can replace this with S3 or another remote state method
  * A host or ansible execution environment with terraform installed
    * The included playbook assumes terraform is installed in the current AWX exectution ENV


## Setup
### Import the DB Credential
Create a Credential Type from the template in: ./ansible-wrapper/awx-tf-pg-credential.yaml

### Create a Job Template
Create a Job Template from: ./ansible-wrapper/awx-run-terraform.yaml

Must include
  * Postgres DB Credential
  * Vars for Terraform

