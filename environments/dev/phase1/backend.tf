terraform {
  backend "s3" {
    bucket = "v-backend-s3"
    key    = "dev/phase1/terraform.tfstate"
    region = "us-east-1"
  }
}
