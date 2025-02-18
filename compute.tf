resource "linode_instance" "bolt" {
  label = "bolt-${var.primary_region}"
  image = "linode/ubuntu24.04"
  region = var.primary_region
  type = "g2-gpu-rtx4000a1-s"
  root_pass = "CodingAI.123!" # Change this!
  tags = [ "app:codingAI" ]
  private_ip = false

  metadata {
    user_data = "${base64encode(file("./linode.yaml"))}"
  }
}

resource "null_resource" "delayed_provision" {
  depends_on = [linode_instance.bolt]

  provisioner "local-exec" {
    command = "sleep 300"  # Delay for 300 seconds (5 minutes)
  }
}

resource "null_resource" "ssh_provision" {
  depends_on = [null_resource.delayed_provision]

  provisioner "remote-exec" {
    inline = [
      "chmod +x /usr/local/bin/ollama-setup.sh",  # Ensure the script is executable
      "/usr/local/bin/ollama-setup.sh"            # Run the script
    ]
    
    connection {
      host = linode_instance.bolt.ip_address
      user = "root"
      password = "CodingAI.123!"
    }
  }
}
