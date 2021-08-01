terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "invadelabs"

    workspaces {
      name = "cloudflare"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 2.0"
    }
  }
}
