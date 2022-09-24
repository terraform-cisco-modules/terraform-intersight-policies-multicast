module "multicast_policy" {
  source  = "terraform-cisco-modules/policies-multicast/intersight"
  version = ">= 1.0.1"

  description      = "default Multicast Policy."
  name         = "default"
  organization = "default"
}
