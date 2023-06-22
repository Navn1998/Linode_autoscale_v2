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

resource "linode_instance" "terraform-web" {
  image           = "linode/ubuntu22.04"
  label           = "Terraform-Web-Example"
  group           = "Terraform"
  region          = "us-east"
  type            = "g6-standard-1"
  authorized_keys = [var.ssh_public_key]
  root_pass       = var.root_password

  # Task to verify SSH connectivity is ready
  provisioner "remote-exec" {
    inline = ["cat /etc/os-release"]

    # Configure parameters for SSH so Terraform can connect to the new instance
    connection {
      type        = "ssh"
      user        = "root"
      host        = self.ip_address
      private_key = file(var.ssh_private_key)
    }
  }

  # Run an Ansible playbook against the new instance
  provisioner "local-exec" {
    command = "ansible-playbook -u root -i '${self.ip_address},' -e 'ansible_python_interpreter=/usr/bin/python3' --private-key /var/lib/jenkins/.ssh/id_ed25519 apache.yml"
  }
}
