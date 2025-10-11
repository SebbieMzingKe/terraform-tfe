locals {
  project = {
    "cloud-infrastructure" = {
      description = "example description project"
    }
  }
  workspace = {
    "cloud-infrastructure-tfe" = {
      description    = "example description workspace"
      execution_mode = "local"
      project_id     = module.project["cloud-infrastructure"].id
    }
  }
}
