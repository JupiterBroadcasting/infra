data "cloudflare_zone" "main_com_domain" {
  name = "jupiterbroadcasting.com"
}

data "cloudflare_zone" "ssh_show_domain" {
  name = "selfhosted.show"
}

resource "cloudflare_record" "jb_com" {
  for_each = var.jb_com_subdomains

  zone_id = data.cloudflare_zone.main_com_domain.id
  name    = each.value["name"]
  value   = each.value["value"]
  type    = each.value["type"]
  proxied = each.value["proxied"]
}

resource "cloudflare_record" "ssh_show" {
  for_each = var.ssh_show_subdomains

  zone_id = data.cloudflare_zone.ssh_show_domain.id
  name    = each.value["name"]
  value   = each.value["value"]
  type    = each.value["type"]
  proxied = each.value["proxied"]
}

resource "cloudflare_page_rule" "jbcom_pagerules" {
  for_each = var.jb_com_pagerules

  zone_id = data.cloudflare_zone.main_com_domain.id
  target  = each.value["target"]
  # added, because it'll continue to say there are modifications
  #   if not explicitly declared
  priority = each.value["priority"]
  actions {
    forwarding_url {
      url         = each.value["forwarded_url"]
      status_code = each.value["status_code"]
    }
  }
  
}