provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Project   = "tenderready-ai"
      ManagedBy = "terraform"
    }
  }
}

data "aws_caller_identity" "current" {}
