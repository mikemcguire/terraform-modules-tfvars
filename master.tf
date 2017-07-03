/*******************************************************************************
-
- Loads our global resources that are used throughout the infrastructure
-
*******************************************************************************/
# ------------------------------------------------------------------------------
# Services
# ------------------------------------------------------------------------------
variable "do_token" {}
module "digital_ocean" {
    source          = "./providers/digital_ocean"
    token           = "${var.do_token}"
}


variable "cloudflare_email" {}
variable "cloudflare_token" {}
module "cloud_flare" {
    source          = "./providers/cloud_flare"
    email = "${var.cloudflare_email}"
    token = "${var.cloudflare_token}"
}


# ------------------------------------------------------------------------------
# DNS Records (cloudflare)
# ------------------------------------------------------------------------------
#module "dns" {
#  source    = "./dns/"
#}


/*******************************************************************************
-
- Set up our jenkins Infrastructure
-
*******************************************************************************/
# ------------------------------------------------------------------------------
# Master Server
# ------------------------------------------------------------------------------
variable "ssh_fingerprint" {}
variable "pub_key" {}
variable "pvt_key" {}
module "jenkins" {
  source    = "./management/jenkins/"
  pvt_key   = "${pvt_key}"
  pub_key   = "${pub_key}"
  ssh_fingerprint   = "${ssh_fingerprint}"
}


# ------------------------------------------------------------------------------
# Slave Server
# ------------------------------------------------------------------------------
