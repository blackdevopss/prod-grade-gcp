resource "google_compute_network" "vpc" {
  for_each                        = var.vpc_networks
  project                         = each.value.project_id
  name                            = each.key
  auto_create_subnetworks         = each.value.auto_create_subnetworks
  mtu                             = each.value.mtu
  delete_default_routes_on_create = each.value.delete_default_routes_on_create
  routing_mode                    = each.value.routing_mode
  description                     = each.value.description
}

variable "vpc_networks" {
  type = map(object({
    project_id                      = string
    auto_create_subnetworks         = bool
    mtu                             = number
    delete_default_routes_on_create = bool
    routing_mode                    = string
    description                     = string

  }))
  default = {
    "vpc-bdohub-westus" = {
      auto_create_subnetworks         = false
      delete_default_routes_on_create = false
      description                     = "Hub Virtual Network"
      mtu                             = 1460
      project_id                      = "slsfs-hub"
      routing_mode                    = "REGIONAL"
    }
  }

}

output "vpc_network_id" {
  value = tomap({
    for id, vpc in google_compute_network.vpc : id => {
      vpc_network_id = vpc.id
    }
  })
}

