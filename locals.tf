locals {
  project = {
    "cloud-infrastructure-tfe" = {
      description = "example description project"
    }
  }
  workspace = {
    "cloud-infrastructure-tfe" = {
      description    = "example description workspace"
      execution_mode = "remote"
      project_id     = module.project["cloud-infrastructure-tfe"].id
      vcs_repo_identifier = "${var.github_organization_name}/terraform-tfe"
    }
  }
}
