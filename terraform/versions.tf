terraform {
  required_version = ">= 1.0"

  # Required so `terraform init -backend-config=...` (see scripts/deploy.sh) actually
  # uses the S3 remote backend. Without this block, flags are ignored and CI uses a
  # fresh local state each run → BucketAlreadyExists / EntityAlreadyExists.
  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  # Uses AWS CLI configuration (aws configure)
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}