terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.2.0"
    }
  }
  required_version = ">= 1.1.0"
}

resource "mongodbatlas_project" "example_project" {
  name   = var.project_name
  org_id = var.org_id
}

output "project_id" {
  value = mongodbatlas_project.example_project.id
}