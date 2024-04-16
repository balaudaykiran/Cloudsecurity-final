variable "region" {
  default = "us-east-1"
}

data "vault_generic_secret" "aws_details" {
  path = "secret/aws"
}

