resource "cloudflare_zone" "invadelabs" {
  zone       = "invadelabs.com"
  account_id = data.terraform_remote_state.gcp.outputs.cloudflare.accountid
  plan       = "free"
  paused     = "false" #  whether this zone is paused (traffic bypasses Cloudflare)
}
