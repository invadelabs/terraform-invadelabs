output "cloudflare_zone_id" {
  value = cloudflare_zone.invadelabs.id
}

data "cloudflare_ip_ranges" "cloudflare" {}

output "cloudflare_ip_ranges" {
  value = data.cloudflare_ip_ranges.cloudflare
}
