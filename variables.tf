variable "token" {
  type = string
}
variable "authorized_keys" {
  type = list(string)
}
variable "root_pass" {
  type = string
}
variable "region" {
  default = "eu-central"
  type    = string
}
variable "image" {
  default = "linode/ubuntu22.04"
  type    = string
}

variable "gh_username" {
  description = "GitHub username whose user account will be created using the SSH Keys stored on GitHub"
  type        = string
}

variable "public_stackscript" {
  default = "false"
}
