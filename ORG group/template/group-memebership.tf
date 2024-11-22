/* module "membership_template" {
  for_each     = {
    for k, v in try(var.membership_template,{}): k => v if v.delete != true
  }
    source = "/home/sushma_tripathi/QUEST/mineTesting/Modules/google_cloud_identity_group_membership"
    group_email                     = each.value.group_email
    roles                           = each.value.roles
    member_key                      = each.value.member_key
    id                              = each.key
    namespace                       = each.value.namespace
} */