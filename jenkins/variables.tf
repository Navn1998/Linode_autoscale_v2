variable "token" {
type = string
default = "<api_token>'"
}

variable "root_password" {
type = string
default = "Navneeth@1998"
}

variable "ssh_private_key"{
type  = string
default = "/var/lib/jenkins/.ssh/id_ed25519"
}

variable "ssh_public_key" {
type =  string
default = "<public key generated through jenkins user>"
}
