terraform {
  backend "s3" {
    bucket = "terraform-storage-bucket-397795833797"
    # I had to hard code the account number as TF does not support interpolation in the backend file.
    key    = "state-files/Kratik-local-terraform-state-for-EKS-Loki-S3-DyanmoDB.tfstate"
    region = "us-east-1"
  }
}
