terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.10.1"
    }
  }
  required_version = ">= 0.13"
}
