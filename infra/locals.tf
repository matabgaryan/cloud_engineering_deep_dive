module "network_secret_ro" {
  source    = "./utils/asm-ro"
  secret_id = "${terraform.workspace}/core-infra-secrets"
}

output "network_secrets" {
  value = module.network_secret_ro.secret_map
}

data "aws_region" "current" {}

locals {
  az_suffix    = ["a", "b", "c", "d", "e", "f"]
  project_name = var.project_name

  # Core Component Configurations.
  core_name_prefix = "${terraform.workspace}.core"
  core_az_count    = module.network_secret_ro.secret_map["core_az_count"]
  core_vpc_cidr    = module.network_secret_ro.secret_map["core_vpc_cidr"]
  core_region      = data.aws_region.current.name
}
