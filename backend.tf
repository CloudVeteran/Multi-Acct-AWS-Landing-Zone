terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-mg-may7"
    key            = "landing-zone/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile   = true
    encrypt        = true
  }
}