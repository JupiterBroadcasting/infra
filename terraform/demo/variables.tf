## Provider configs

provider "linode" {
    # https://developers.linode.com/api/v4/#section/Personal-Access-Token
    token = yamldecode(file("~/.config/tokens/linode.yaml"))["token"]
}

provider "cloudflare" {
    # https://api.cloudflare.com/#getting-started-resource-ids
    email = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["account-email"]
    api_key = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["api-key"]
    #account_id = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["account-id"]

    #domain-me = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["domain-me"]
    #domain-cloud = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["domain-cloud"]
    #domain-show = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["domain-show"]
    #domain-pms = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["domain-pms"]
}

## Grab Linode SSH keys by Label
## linode-cli sshkeys list
data "linode_sshkey" "randy" {
  label = "randy"
}

data "linode_sshkey" "mooncake" {
  label = "mooncake"
}

## Misc

variable "show_subdomain" {
  type = set(string)
}

variable "demo_nodename" {
  type = string
}

variable "linode_image_ubu2004" {
  type = string
  default = "linode/ubuntu20.04"
}

variable "linode_region_us_east" {
  type = string
  default = "us-east"
}

variable "linode_region_uk" {
  type = string
  default = "eu-west"
}

variable "linode_type_5usd_1gb" {
  #1vcpu, 1gb, 25gb
  type = string
  default = "g6-nanode-1"
}

variable "linode_type_10usd_2gb" {
  #1vcpu, 2gb, 50gb 
  type = string
  default = "g6-standard-1"
}

variable "linode_type_20usd_4gb" {
  #2vcpu, 4gb, 80gb
  type = string
  default = "g6-standard-2"
}

variable "linode_type_40usd_8gb" {
  #4vcpu, 8gb, 160gb
  type = string
  default = "g6-standard-3"
}