# GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
}
# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
}
# define GCP project name
variable "gcp_project" {
  type        = string
  description = "GCP project name"
}

variable "gcp_zone" {
  type = string
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
}
