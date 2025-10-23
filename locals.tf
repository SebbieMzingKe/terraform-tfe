locals {
  project = {
    "cloud-infrastructure-tfe" = {
      description = "example description project"
    }
  }
  workspace = {
    "cloud-infrastructure-tfe" = {
      description         = "example description workspace"
      execution_mode      = "remote"
      project_id          = module.project["cloud-infrastructure-tfe"].id
      vcs_repo_identifier = "${var.github_organization_name}/terraform-tfe"
    }
    "cloud-infrastructure-github" = {
      description         = "example automation workspace for github resources"
      execution_mode      = "remote"
      project_id          = module.project["cloud-infrastructure-tfe"].id
      vcs_repo_identifier = "${var.github_organization_name}/cloud-infrastructure-github"
    }

    "cloud-infrastructure-aws-network" = {
      description         = "automation workspace for network resources"
      execution_mode      = "remote"
      project_id          = module.project["cloud-infrastructure-tfe"].id
      vcs_repo_identifier = "${var.github_organization_name}/cloud-infrastructure-aws-network"

      variable = [
        {
          category = "terraform"
          hcl      = true
          key      = "azs"
          value    = jsonencode(["us-west-2a", "us-west-2b"])
        },
        {
          category = "terraform"
          key      = "cidr"
          value    = "10.0.0.0/16"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "enterprise-cloud-infra"
        },
      ]
    }


    "cloud-infrastructure-aws-cluster-prod" = {
      description         = "automation workspace for cluster resources"
      execution_mode      = "remote"
      project_id          = module.project["cloud-infrastructure-tfe"].id
      vcs_repo_identifier = "${var.github_organization_name}/cloud-infrastructure-aws-cluster"

      variable = [
        {
          category = "terraform"
          key      = "domain"
          value    = "muyoma.space"
        },
        {
          category = "terraform"
          key      = "environment"
          value    = "prod"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "enterprise-cloud-infra-seb"
        },
        {
          category = "terraform"
          key      = "vpc_name"
          value    = "enterprise-cloud-infra"
        },
      ]
    }

    "cloud-infra-product-service-prod" = {
      description         = "Automation for product service resources."
      execution_mode      = "remote"
      project_id          = module.project["cloud-infra-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/cloud-infra-product-service"

      variables = [
        {
          category = "terraform"
          key      = "cluster_name"
          value    = "cloud-infra-seb-prod"
        },
        {
          category = "terraform"
          key      = "environment"
          value    = "prod"
        },
      ]
    }
  }
}
