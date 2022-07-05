resource "google_compute_instance" "invadelabs_green" {
  name         = "invadelabs-green"
  description  = "invadelabs.com gcp vm (green)"
  machine_type = "e2-micro"
  zone         = "us-west1-a"
  hostname     = "invadelabs.com"
  #labels       = { "key2" : "value2" }
  #metadata     = { "key1" : "value1" }
  tags = ["http-server",
    "https-server",
    "allow-drew-nm1",
  ]
  # runs each boot, not first boot only
  #metadata_startup_script = "sudo apt-get update && sudo apt-get install -y ansible rclone etckeeper && cd /etc && etckeeper init"
  deletion_protection = true

  boot_disk {
    device_name = "invadelabs-green-disk-0"
    initialize_params {
      image = "ubuntu-2204-lts"
      #labels = { "key3" : "value3" }
      type = "pd-standard" # or pd-balanced or pd-ssd
      size = "10"
    }
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  network_interface {
    subnetwork = "invadelabs"
    # do not uncomment access_config {} block to get ephemeral IP
    access_config {
      nat_ip = google_compute_address.invadelabs-ext.address # un/comment to associate main IP
    }
  }
}
