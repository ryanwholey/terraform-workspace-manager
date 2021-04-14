# aws kms encrypt --key-id=<key-id> --plaintext $(echo -n <value> | base64)
locals {
  secrets = {
    FOO = "AQICAHhzlvREPo0EYsrPOi/PlrdeZ4+N0pzFxeXwWGaLCn5VowF1hV0b3aJuABkzZpG3r2mwAAAAYTBfBgkqhkiG9w0BBwagUjBQAgEAMEsGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMmQGGL5zzkT6TLjIlAgEQgB6Dw/tDBLpG/5uZCkr/SDW080DOslTif7SVyJ6zPKY="
  }
}

resource "aws_s3_bucket" "workspace_configs" {
  bucket = "workspace-configs"
  acl    = "private"
}

resource "aws_kms_key" "key" {
  description = "KMS key used to decrypt secrets"
}

data "aws_kms_secrets" "secrets" {
  dynamic "secret" {
    for_each = local.secrets

    content {
      name    = secret.key
      payload = secret.value
    }
  }
}
