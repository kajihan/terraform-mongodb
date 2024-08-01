terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.2.0"
    }
  }
  required_version = ">= 1.1.0"
}

resource "mongodbatlas_project_ip_access_list" "allow_all" {
  project_id = var.project_id

  for_each = toset(var.cidr_block)

  cidr_block = each.value
}