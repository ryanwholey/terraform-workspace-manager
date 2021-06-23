resource "tfe_workspace" "workspace" {
  name         = var.name
  organization = var.organization
}

resource "tfe_variable" "test" {
  for_each = var.secrets

  key          = each.key
  value        = each.value
  category     = "env"
  workspace_id = tfe_workspace.workspace.id
}
