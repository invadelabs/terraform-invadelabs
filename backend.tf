terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "invadelabs"

    workspaces {
      name = "terraform-invadelabs"
    }
  }
}
