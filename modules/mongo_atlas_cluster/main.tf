terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.2.0"
    }
  }
  required_version = ">= 1.1.0"
}

resource "mongodbatlas_cluster" "cluster-test" {
  project_id                  = var.project_id
  name                        = var.cluster_name
  provider_name               = var.provider_name
  backing_provider_name       = var.backing_provider_name
  provider_region_name        = var.provider_region_name
  provider_instance_size_name = var.provider_instance_size_name
}