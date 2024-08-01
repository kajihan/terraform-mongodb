variable "MONGODB_ATLAS_PUBLIC_KEY" {
  description = "MongoDB Atlas public key"
  type        = string
}
variable "MONGODB_ATLAS_PRIVATE_KEY" {
  description = "MongoDB Atlas private key"
  type        = string
}
variable "MONGODB_ATLAS_ORGANIZATION_ID" {
  description = "Organization ID where the project will be created"
  type        = string
}
variable "PROJECT_NAME" {
  description = "Name of the project to be created"
  type        = string
}
