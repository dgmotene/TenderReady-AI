output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
output "name_prefix" {
  value = local.name_prefix
}
output "docs_bucket_name" {
  value = module.storage.bucket_name
}
output "tenders_table_name" {
  value = module.database.table_name
}
output "user_pool_id" {
  value = module.auth.user_pool_id
}
output "user_pool_client_id" {
  value = module.auth.user_pool_client_id
}
output "cognito_issuer_url" {
  value = module.auth.issuer_url
}