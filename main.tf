

module "project" {
  for_each = local.project

  source  = "ALT-F4-LLC/project/tfe"
  version = "0.5.0"

  description = each.value.description
  name = each.key
  organization_name = var.organization_name
}

module "workspace" {
  for_each = local.project

  source  = "ALT-F4-LLC/workspace/tfe"
  version = "0.8.0"

  description = each.value.description
  execution_mode = "local"
  name = each.key
  organization_name = var.organization_name
  project_id = module.project[each.key].id 
}

# moved {
#   from = module.workspace["cloud-infrastructure"]
#   to = module.workspace["cloud-infrastructure-tfe"]
# }