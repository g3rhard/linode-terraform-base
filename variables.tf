variable "token" {}
variable "authorized_keys" {}
variable "root_pass" {}
variable "region" {
  default = "eu-central"
}
variable "image" {
  default = "linode/ubuntu22.04"
}
