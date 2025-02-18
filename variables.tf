variable "linode_token" {
  default = "YourLinodeTokenGoesHere"
  type = string
  sensitive   = true
}

variable "primary_region" {
  default = "fr-par"
  type = string
}

variable "ip_address" {
  default = "1.2.3.4/32"
  type = string
}
