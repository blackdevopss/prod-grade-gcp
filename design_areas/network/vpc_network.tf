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



