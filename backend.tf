terraform {
  backend "s3" {
    bucket = "<BUCKET_NAME_HERE>"
    key    = "state/infra.tfstate"
    region = "<REGION_HERE>"
  }
}