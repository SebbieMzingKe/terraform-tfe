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
      name = "cloud-infrastructure"
      project_id     = module.project["cloud-infrastructure-tfe"].id
      vcs_repo_identifier = "SebbieMzingKe/terraform-tfe"
    }
  }
}
