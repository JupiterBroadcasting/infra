resource "cloudflare_record" "jb_com" {
  for_each = var.jb_com_subdomains

  zone_id  = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["domain-jb-com"]
  name     = each.value["name"]
  value    = each.value["value"]
  type     = each.value["type"]
  proxied  = each.value["proxied"]
}

resource "cloudflare_record" "ssh_show" {
  for_each = var.ssh_show_subdomains

  zone_id  = yamldecode(file("~/.config/tokens/cloudflare.yaml"))["domain-ssh-show"]
  name     = each.value["name"]
  value    = each.value["value"]
  type     = each.value["type"]
  proxied  = each.value["proxied"]
}
