resource "tfe_workspace" "workspace" {
  name         = var.name
  organization = var.organization

  auto_apply = var.auto_apply
}

resource "tfe_variable" "secrets" {
  for_each = var.secrets

  key          = each.key
  value        = each.value
  category     = "env"
  workspace_id = tfe_workspace.workspace.id
}
