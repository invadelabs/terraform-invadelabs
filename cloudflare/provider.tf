provider "cloudflare" {
  #email   = var.cloudflare_email
  #api_key = var.cloudflare_api_key
  email   = data.terraform_remote_state.gcp.outputs.cloudflare.email
  api_key = data.terraform_remote_state.gcp.outputs.cloudflare.key
}
