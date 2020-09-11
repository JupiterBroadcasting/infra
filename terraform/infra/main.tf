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
  value = module.node.ipv4
}

# module "demodns" {
#   source = "../modules/cloudflare-record"

#   zone_id = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["domain-show"]
#   name    = "demo"
#   value   = module.node.ipv4
#   type    = "A"
# }
