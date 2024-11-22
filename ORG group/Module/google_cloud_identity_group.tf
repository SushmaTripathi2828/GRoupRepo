data "google_organization" "org" {
  organization                  = var.organization             
  domain                        = var.domain
}
resource "google_cloud_identity_group" "identitiy_group" {
    display_name                = var.display_name
    description                 = var.description
    parent                      = "customers/${data.google_organization.org.directory_customer_id}"
    dynamic "group_key" {
      for_each = var.group_key[*]
      content {
        id                      = lookup(group_key.value, "id")
        namespace               = lookup(group_key.value, "namespace")
      }
    }
    initial_group_config        = var.initial_group_config
    labels                      = var.labels
}     
/* resource "google_cloud_identity_group_membership" "membership" {
  group = google_cloud_identity_group.identitiy_group.id
  preferred_member_key {
    id = "sami@gcpscaledelivery.com"
  }
  roles {
    name = "MEMBER"
  }
  
} */
resource "google_cloud_identity_group_membership" "group_membership" {
  provider = google-beta
    group                             = data.google_cloud_identity_group_lookup.group.name
    dynamic "roles" {
        for_each = var.roles[*]
        content {
          name                        = lookup(roles.value, "name")
          dynamic "expiry_detail" {
            for_each                  = lookup(roles.value, "expiry_detail", [])
            content {
              expire_time             = lookup(expiry_detail.value, "expire_time", null)
            }
          }
        }               
      
    }
    dynamic "member_key" {
      for_each = var.member_key == null ? [] : var.member_key[*]
      content {
        id                            = lookup(member_key.value, "id")
        namespace                     = lookup(member_key.value, "namespace")
      }
    }
    preferred_member_key {
      id                              =  var.id
      namespace                       = var.namespace
    } 
/*     dynamic "preferred_member_key" {
      for_each = var.member_key == null ? var.preferred_member_key[*] : []
        content {
          id                          = lookup(preferred_member_key.value, "id")
        namespace                     = lookup(preferred_member_key.value, "namespace")
      }
    } */
}