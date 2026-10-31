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

locals {
  # New names so this stack never clashes with the old hackathon one
  name_prefix = "${var.project}-${var.env}"
}