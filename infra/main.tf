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

module "storage" {
  source          = "./modules/storage"
  name_prefix     = local.name_prefix
  account_id      = data.aws_caller_identity.current.account_id
  allowed_origins = var.allowed_origins
}

module "database" {
  source      = "./modules/database"
  name_prefix = local.name_prefix
}

module "auth" {
  source      = "./modules/auth"
  name_prefix = local.name_prefix
}