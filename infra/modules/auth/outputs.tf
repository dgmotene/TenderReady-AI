output "user_pool_id" {
  value = aws_cognito_user_pool.this.id
}
output "user_pool_client_id" {
  value = aws_cognito_user_pool_client.web.id
}
output "issuer_url" {
  description = "Used later by the API Gateway JWT authorizer"
  value       = "https://${aws_cognito_user_pool.this.endpoint}"
}