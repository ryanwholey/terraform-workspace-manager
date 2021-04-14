terraform {
  backend "remote" {
    organization = "ryanwholey"

    workspaces {
      name = "terraform-workspace-manager"
    }
  }
}
