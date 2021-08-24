terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "invadelabs"

    workspaces {
      name = "improvmx"
    }
  }

  required_providers {
    improvmx = {
      source  = "issyl0/improvmx"
      version = "0.4.2"
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
