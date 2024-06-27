##########
# GCP Project
##########

variable "gcp_project_id" {
  type    = string
}

variable "provider_gcp_region" {
  type    = string
  default = "us-west1"
}

variable "terraform_sa_email" {
  type = string
}

############
# SVPC
############

variable "svpc_host_project_id" {
  type = string
  description = "(Required) The ID of a host project to associate."
}

variable "svpc_host_subnets" {
  type = list(object({
    name = string
    region = string
    members = optional(list(string), [])
  }))
  description = "List of subnets and their region to attach to in host project"
  default = []
}

locals {
  svpc_host_subnets = [
    for subnet in var.svpc_host_subnets :
    {
      name = subnet.name
      region = subnet.region
      members = distinct(concat(subnet.members, ["serviceAccount:${var.terraform_sa_email}"]))
    }
  ]
}
