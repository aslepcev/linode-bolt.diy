resource "linode_firewall" "lb-fw" {
  label = "bolt-firewall"

  inbound {
    label    = "allow-ssh"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["${var.ip_address}"]
  }

  inbound {
    label    = "allow-bolt"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "5173"
    ipv4     = ["${var.ip_address}"]
  }  

  inbound_policy = "DROP"

  outbound_policy = "ACCEPT"

  linodes = [linode_instance.bolt.id]
}
