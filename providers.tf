terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.39.1"
    }
  }
}

provider "aws" {
  region = var.region
  access_key = data.vault_generic_secret.aws_details.data["access_key"]
  secret_key = data.vault_generic_secret.aws_details.data["secret_key"]
}

provider "vault" {
  address = "http://127.0.0.1:8200"
}
