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

output "storage" {
  value = {
    bucket = aws_s3_bucket.workspace_configs.bucket
    access_key = aws_iam_access_key.user.id
    secret_key = aws_iam_access_key.user.secret
  }
  sensitive = true
}
