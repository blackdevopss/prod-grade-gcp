# GCP Provider Settings
gcp_project   = "slsfs-hub"
gcp_region    = "us-west1"
gcp_auth_file = "./slsfs-dev.json"
gcp_zone      = "us-west1-a"

vpc_networks = {

  "vpc-bdohub-westus" = {
    auto_create_subnetworks         = false
    delete_default_routes_on_create = false
    description                     = "Hub Virtual Network"
    mtu                             = 1460
    project_id                      = "slsfs-hub"
    routing_mode                    = "REGIONAL"
  }
}