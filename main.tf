terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.2.0"
    }
  }
  required_version = ">= 1.1.0"
}

provider "mongodbatlas" {
  public_key  = var.MONGODB_ATLAS_PUBLIC_KEY
  private_key = var.MONGODB_ATLAS_PRIVATE_KEY
}

module "mongo_atlas_project" {
  source = "./modules/mongo_atlas_project"

  project_name = var.PROJECT_NAME
  org_id       = var.MONGODB_ATLAS_ORGANIZATION_ID
}

module "mongo_atlas_cluster" {
  source = "./modules/mongo_atlas_cluster"

  project_id                  = module.mongo_atlas_project.project_id
  cluster_name                = "mycluster"
  provider_name               = "TENANT"
  backing_provider_name       = "AWS"
  provider_region_name        = "US_EAST_1"
  provider_instance_size_name = "M0"
}

module "mongo_atlas_user" {
  source = "./modules/mongo_atlas_user"

  project_id         = module.mongo_atlas_project.project_id
  username           = "bob"
  password           = "fXUJAFkf5ZZbuY6z"
  auth_database_name = "admin"
  role_name          = "readWrite"
  database_name      = "db"

  depends_on = [module.mongo_atlas_cluster]
}

module "mongo_atlas_ip_access_list" {
  source = "./modules/mongo_atlas_ip_access_list"

  project_id = module.mongo_atlas_project.project_id
  cidr_block = ["0.0.0.0/1", "128.0.0.0/1"]

  depends_on = [module.mongo_atlas_user]
}