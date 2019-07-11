terraform {
  required_version = "0.11.11"

  backend "s3" {
    key                    = "test-terraform.tfstate"
    region                 = "us-east-2"
  }
}
