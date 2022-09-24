#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > {Name}
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  name = var.organization
}

#__________________________________________________________________
#
# Intersight Multicast Policy
# GUI Location: Policies > Create Policy > Multicast
#__________________________________________________________________

resource "intersight_fabric_multicast_policy" "multicast" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  description             = var.description != "" ? var.description : "${var.name} Multicast Policy."
  name                    = var.name
  querier_ip_address      = var.querier_ip_address
  querier_ip_address_peer = var.querier_ip_address_peer
  querier_state           = var.querier_state
  snooping_state          = var.snooping_state
  organization {
    moid        = data.intersight_organization_organization.org_moid.results[0].moid
    object_type = "organization.Organization"
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
