/* module "group_creation" {
  for_each     = {
    for k, v in try(var.group_creation,{}): k => v if v.delete != true
  }
    source = "/home/sushma_tripathi/QUEST/mineTesting/Modules/google_cloud_identity_group"
    display_name                    = each.key
    description                     = each.value.description
    domain                          = each.value.domain
    labels                          = each.value.labels
    group_key                       = each.value.group_key
    initial_group_config            = each.value.initial_group_config
} */