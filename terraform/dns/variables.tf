## Provider configs
provider "cloudflare" {
  # https://api.cloudflare.com/#getting-started-resource-ids
#####
# migrate to using .envrc environment variables
#   email   = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["account-email"]
#   api_key = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["api-key"]
#####
}

# https://stackoverflow.com/questions/70785025/terraform-for-each-map-of-objects
variable "jb_com_subdomains" {
    type = map(object({
        name    = string
        proxied = bool
        value   = string
        type    = string
        ttl = string # value of 1 = auto
    }))
}

variable "ssh_show_subdomains" {
    type = map(object({
        name    = string
        proxied = bool
        value   = string
        type    = string
        ttl = string # value of 1 = auto
    }))
}

variable "jb_com_pagerules" {
    type = map(object({
        target        = string
        forwarded_url = string
        status_code   = string
        priority      = number
    }))
}