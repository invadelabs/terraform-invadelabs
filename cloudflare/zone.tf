resource "cloudflare_zone" "invadelabs" {
  zone = "invadelabs.com"
  plan = "free"
  paused = "false" #  whether this zone is paused (traffic bypasses Cloudflare)
}
