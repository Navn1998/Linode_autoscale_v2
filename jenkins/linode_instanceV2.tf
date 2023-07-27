ariable "min_instances" {
  type    = number
  default = 1
}

variable "max_instances" {
  type    = number
  default = 5
}

variable "scaling_threshold" {
  type    = number
  default = 80
}

terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.27.1"
    }
  }
}

provider "linode" {
  token = var.token
}

locals {
  scaling_enabled = var.max_instances > var.min_instances
}

resource "linode_instance" "my_instance" {
  count      = local.scaling_enabled ? var.max_instances : var.min_instances
  label      = "my-instance-${count.index + 1}"
  region     = "us-west"
  type       = "g6-standard-1"
  image      = "linode/ubuntu20.04"
  root_pass  = var.root_password
}
