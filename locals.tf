locals {
  name = "${local.config.Environment}-${var.app_name}"

  config = jsondecode(file("${path.module}/payload.json"))

  tags = {
    "Environment" = local.config.Environment
    "Provisioner" = "terraform"
    "App Name"    = var.app_name
    "App-ID"      = local.config["AppdID"]
  }
}
