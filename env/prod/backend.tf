terraform {
  backend "s3" {
    bucket = "terraform-state-estudos"
    key    = "prod/terraform.tfstate"      # caminho + nome do arquivo referente ao estado do terraform
    region = "us-east-1"
  }
}