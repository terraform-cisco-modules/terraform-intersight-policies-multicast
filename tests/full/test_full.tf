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
