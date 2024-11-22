/* output "group_creation_details" {
    value = module.group_creation
    description = "This is the group details"
}

output "group_creation_details" {
    value = module.membership_template
    description = "This is the group_membership details"
} */

output "project_iam_binding_details" {
    value = module.project_iam_binding 
    description = "This is peoject membership details"
}