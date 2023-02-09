resource "google_compute_instance" "vm" {
  name         = var.inatancename 
  machine_type = var.instancetype
  zone         = var.instancezone
  

  boot_disk {
    initialize_params {
      image = var.image-name
    }
  }

  network_interface {
    network = google_compute_network.myvpc.name
    subnetwork = google_compute_subnetwork.managementsubnet.name
  }
  service_account {
    email  = google_service_account.myinstance-sa.email
    scopes = ["cloud-platform"]
  }
}

