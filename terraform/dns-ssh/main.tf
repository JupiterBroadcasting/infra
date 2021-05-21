resource "cloudflare_record" "show" {
  zone_id  = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["domain-show"]
  for_each = var.show_subdomain
  name     = each.key
  #value    = element(tolist(module.node.ipv4), 0)
  value    = "45.79.147.12"
  type     = "A"
}
