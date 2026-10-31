resource "aws_cognito_user_pool" "this" {
  name                     = "${var.name_prefix}-users"
  username_attributes      = ["email"]  # users sign in with their email address
  auto_verified_attributes = ["email"]  # a code is emailed to confirm sign-up
  deletion_protection      = "INACTIVE" # lets "terraform destroy" delete the pool

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_uppercase = true
    require_numbers   = true
    require_symbols   = false
  }

  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }
}

# The website's app client. No secret, because browser code cannot keep one.
resource "aws_cognito_user_pool_client" "web" {
  name            = "${var.name_prefix}-web"
  user_pool_id    = aws_cognito_user_pool.this.id
  generate_secret = false

  explicit_auth_flows           = ["ALLOW_USER_SRP_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]
  prevent_user_existence_errors = "ENABLED"
  enable_token_revocation       = true

  access_token_validity  = 60
  id_token_validity      = 60
  refresh_token_validity = 30
  token_validity_units {
    access_token  = "minutes"
    id_token      = "minutes"
    refresh_token = "days"
  }
}