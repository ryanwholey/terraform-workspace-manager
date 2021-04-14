output "storage_bucket" {
  value = aws_s3_bucket.workspace_configs.bucket
}

output "secret_key_id" {
  value = aws_kms_key.key.id
}

output "secrets" {
  value     = data.aws_kms_secrets.secrets.plaintext
  sensitive = true
}
