# generated a PAT (Personal Access Token) from here: https://www.linode.com/docs/products/tools/linode-api/guides/get-access-token/
#   give access to whatever terraform will need to read and write to

provider "linode" {
#   token = var.linode_token
}

data "linode_object_storage_cluster" "primary" {
  id = "us-east-1"
}

resource "linode_object_storage_key" "terraform_access" {
  label = "terraform_backend_access"
}

resource "linode_object_storage_bucket" "terraform_backend" {
  cluster = data.linode_object_storage_cluster.primary.id
  label = "terraform-backend"
  access_key = linode_object_storage_key.terraform_access.access_key
  secret_key = linode_object_storage_key.terraform_access.secret_key
  # default enabled in web-ui
  acl = "private"
  cors_enabled = true
  # best practice for terraform state buckets (allows you to rollback if needed)
  versioning = true
}