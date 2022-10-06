terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
}

# Setup provider, variables and outputs
provider "intersight" {
  apikey    = var.intersight_keyid
  secretkey = file(var.intersight_secretkeyfile)
  endpoint  = var.intersight_endpoint
}

variable "intersight_keyid" {}
variable "intersight_secretkeyfile" {}
variable "intersight_endpoint" {
  default = "intersight.com"
}
variable "name" {}

output "moid" {
  value = module.main.moid
}

# This is the module under test
module "main" {
  source                  = "../.."
  description             = "${var.name} Multicast Policy."
  name                    = var.name
  organization            = "terratest"
  querier_ip_address      = "198.18.2.5"
  querier_ip_address_peer = "198.18.2.6"
  querier_state           = "Enabled"
  snooping_state          = "Enabled"
}
