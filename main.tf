resource "google_compute_instance" "invadelabs" {
  name         = "invadelabs"
  description = "invadelabs.com gcp vm"
  machine_type = "e2-micro"
  zone = "us-west1-a"
  hostname = "invadelabs.com"
  labels = {"key2": "value2"}
  metadata = {"key1": "value1"}
  tags = ["http-server", 
         "https-server",]
  metadata_startup_script = "sudo apt-get update && sudo apt-get install -y ansible rclone etckeeper && cd /etc && etckeeper init"
  deletion_protection = true

  boot_disk {
    device_name = "invadelabs-disk-0"
    initialize_params {
      image = "ubuntu-2004-lts"
      #device_name = "invadelabs"
      labels = {"key3": "value3"}
      type = "pd-standard" # or pd-balanced or pd-ssd
      size = "10"
    }
  }

  scheduling {
    automatic_restart = true
    on_host_maintenance = "MIGRATE"
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
      # nat_ip = google_compute_address.invadelabs-ext.address # un/comment to associate main IP
    }
  }
}
