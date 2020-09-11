resource "cloudflare_record" "record" {
    zone_id = var.zone_id
    name = var.record_name
    value = var.value
    type = var.type
}