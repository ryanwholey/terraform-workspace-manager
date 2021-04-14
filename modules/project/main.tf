resource "tfe_workspace" "workspace" {
  name         = var.config["name"]
  organization = "ryanwholey"
}

resource "tfe_variable" "test" {
  for_each = var.secrets

  key          = each.key
  value        = each.value
  category     = "env"
  workspace_id = tfe_workspace.workspace.id
}
