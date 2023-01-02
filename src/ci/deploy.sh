#!/bin/sh

cd repo/terraform
terraform --version
terraform init -backend-config=backend.hcl
terraform plan
terraform apply --auto-approve
