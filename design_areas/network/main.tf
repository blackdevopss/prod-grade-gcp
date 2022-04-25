terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.19.0"
    }
  }
}

provider "google" {
  project     = var.gcp_project
  region      = var.gcp_region
  zone        = var.gcp_zone
  credentials = file(gcp_auth_file)
  # Configuration options
}

terraform {
  cloud {
    organization = "blackdevopss"

    workspaces {
      name = "prod-grade-gcp-network"
    }
  }
}