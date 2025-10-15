terraform {
  cloud {
    organization = "sebbie"

    workspaces {
      name = "cloud-infrastructure-tfe"
    }
  }
}