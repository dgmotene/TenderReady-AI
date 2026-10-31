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