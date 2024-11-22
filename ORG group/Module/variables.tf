variable "display_name" {
  type                            = string
  description                     = "The display name of the Group"
}

variable "description" {
  type                            = string
  description                     = "The description of the Group"
}

variable "domain" {
  type                            = string
  description                     = "The parent of the Group"
}

variable "labels" {
  type                            = map(string)
  description                     = "The labels of the Group"
}

variable "group_key" {
  type                            = list(object({
    id                            = string
    namespace                     = string
  }))
  description                     = "The group key of the Group"
}

variable "initial_group_config" {
    type                          = string
    description                   = "The initial group config of the Group"
}

 variable "organization" {
   type = string
   
 }

 /*+++++++++++++++++++++++++*/
 variable "id" {
    type                            = string
    description                     = "Give The email of the group where you want to add members"
}
variable "roles" {
    description                     = "value"
    type                            = list(object({
        name                        = string
        expiry_details              = list(object({
          expire_time               = string
        }))
        }))
}
 variable "member_key" {
    type                            = list(object({
      id                            = string
      namespace                     = string
    }))
}  
/* variable "preferred_member_key" {
    type                            = list(object({
      id                            = string
      namespace                     = string
    }))
     default = [{
      id                            =    "sushma@gcpscaledelivey.com"
      namespace                     = ""
    }
    ] 
}  */
variable "id" {
  type                              = string
  description                       = "email of the users"
}

variable "namespace" {
  type                              = string
  description                       = "optional"
  
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
variable "namespace1" {
  type          = string
  description = " The namespace in which the entity exists"
}
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/




