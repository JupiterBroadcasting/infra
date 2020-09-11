module "node" {
  source = "../modules/linode-instance"

  label  = "test"
  image  = "linode/ubuntu20.04"
  region = "us-east"
  type   = "g6-standard-1"
  sshkeys = [
    data.linode_sshkey.randy.ssh_key,
    data.linode_sshkey.mooncake.ssh_key
  ]
}

output "ipv4" {
  value = tolist(module.node.ipv4)
}

resource "cloudflare_record" "show" {
  zone_id = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["domain-show"]
  for_each = var.show_subdomain
  name    = each.key
  value   = element(tolist(module.node.ipv4), 0)
  type    = "A" 
}






######### TODO
# module "demodns" {
#   source   = "../modules/cloudflare-record"
#   #for_each = var.show_subdomain

#   zone_id     = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["domain-show"]
#   record_name = "demo"
#   value       = "8.8.8.8"
#   type        = "A"
# }
