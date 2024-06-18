terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "invadelabs"

    required_providers {
      google = {
        version = "~> 5.30.0"
      }
    }

    workspaces {
      name = "gcp"
    }
  }
}

data "terraform_remote_state" "cloudflare" {
  backend = "remote"

  config = {
    hostname     = "app.terraform.io"
    organization = "invadelabs"

    workspaces = {
      name = "cloudflare"
    }
  }
}

data "external" "myipaddr" {
  program = ["bash", "-c", "curl 'https://api.ipify.org?format=json'"]
}
