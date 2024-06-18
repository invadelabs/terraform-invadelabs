terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "invadelabs"

    workspaces {
      name = "cloudflare"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

data "terraform_remote_state" "gcp" {
  backend = "remote"

  config = {
    hostname     = "app.terraform.io"
    organization = "invadelabs"

    workspaces = {
      name = "gcp"
    }
  }
}
