#!/usr/bin/env bash
# Creates the S3 bucket that stores Terraform's state
set -euo pipefail
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
BUCKET="tenderready-tfstate-${ACCOUNT_ID}"

aws s3api create-bucket --bucket "$BUCKET" --region us-east-1
aws s3api put-bucket-versioning --bucket "$BUCKET" --versioning-configuration Status=Enabled
aws s3api put-public-access-block --bucket "$BUCKET" \
  --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true
echo "State bucket: $BUCKET"