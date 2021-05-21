## Provider configs

provider "cloudflare" {
  # https://api.cloudflare.com/#getting-started-resource-ids
  email   = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["account-email"]
  api_key = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["api-key"]
  #account_id = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["account-id"]

  #domain-me = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["domain-me"]
  #domain-cloud = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["domain-cloud"]
  #domain-show = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["domain-show"]
  #domain-pms = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["domain-pms"]
}

## Misc

variable "show_subdomain" {
  type = set(string)
}