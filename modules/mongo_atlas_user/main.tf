terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.2.0"
    }
  }
  required_version = ">= 1.1.0"
}

resource "mongodbatlas_database_user" "bob_user" {
  project_id         = var.project_id
  username           = var.username
  password           = var.password
  auth_database_name = var.auth_database_name

  roles {
    role_name     = var.role_name
    database_name = var.database_name
  }
}