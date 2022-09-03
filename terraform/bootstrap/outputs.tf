output "bucket_endpoint" {
  description = "S3 bucket endpoint URL"
  value = linode_object_storage_bucket.terraform_backend.hostname
}

output "bucket_region" {
  description = "Region the bucket is in"
  value = data.linode_object_storage_cluster.primary.region
}

output "bucket_access_key" {
  description = "Access Key (Secret)"
  value = linode_object_storage_key.terraform_access.access_key
  sensitive = true
}

output "bucket_secret_key" {
  description = "Secret Key (Secret)"
  value = linode_object_storage_key.terraform_access.secret_key
  sensitive = true
}