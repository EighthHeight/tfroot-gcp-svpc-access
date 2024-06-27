##########
# VPC
##########

module "vpc" {
  source = "git@github.com:EighthHeight/terraform-google-vpc.git//modules/google-svpc-access"
  # Project
  gcp_project_id = var.gcp_project_id
  # VPC
  svpc_host_project_id = var.svpc_host_project_id
  svpc_host_subnets = local.svpc_host_subnets
}
