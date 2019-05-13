variable "sc_token" {}

terraform {
  backend "local" {
    path = "./.tf-state"
  }
}

provider "scalingo" {
  api_token = "${var.sc_token}"
}

resource "scalingo_app" "sc_app" {
  name = "sc-terraform-container-types"
}

resource "scalingo_container_type" "default" {
  app    = "${scalingo_app.sc_app.id}"
  name   = "web"
  size   = "L"
  amount = "2"
}
