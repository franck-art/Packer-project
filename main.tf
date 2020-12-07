resource "google_compute_firewall" "nginx-firewall" {
  name    = "packer-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "443"]
  }

  source_tags = ["web"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_address" "static" {
  name = "static-address"
}

resource "google_compute_instance" "nginx-instance" {
  name         = "test"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["ssh-ext", "nginx"]

  boot_disk {
    initialize_params {
      image = "packer-nginx" // put your image packer name here
    }
  }
  network_interface {
    network = "default"
    access_config {
    nat_ip = google_compute_address.static.address
  }
  }

  metadata = {
    role = "nginx"
  }
}
