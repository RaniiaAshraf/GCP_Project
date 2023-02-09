resource "google_compute_network" "myvpc" {
  name                    = var.vpcname
  auto_create_subnetworks = false
}

resource "google_compute_firewall" "firewall" {
  name    = var.firewallname
  network = google_compute_network.myvpc.name   

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  direction = "INGRESS"

}

resource "google_compute_subnetwork" "managementsubnet" {
 name          = var.subnetname
 ip_cidr_range = var.subnetcidr
 network       = google_compute_network.myvpc.id
 region        = var.subnetregion
}


resource "google_compute_subnetwork" "restrictedsubnet" {
 name          = var.subnet2name
 ip_cidr_range = var.subnet2cidr
 network       = google_compute_network.myvpc.id
 region        = var.subnet2region
  secondary_ip_range {
    range_name    = var.pod-name
    ip_cidr_range = var.pod-ip 
  }
  secondary_ip_range {
    range_name    = var.service-range-name
    ip_cidr_range = var.service-range-ip
  }
}

resource "google_compute_router" "routertable" {
  name    = var.routername
  region = var.routerregion 
  network = google_compute_network.myvpc.id
  bgp {
    asn            = 64514
    advertise_mode = "CUSTOM"
  }
}

 
resource "google_compute_router_nat" "natgateway" {
  name                               = var.natgatewayname
  router                             = google_compute_router.routertable.name
  region                             = google_compute_router.routertable.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS" 

  subnetwork {
    name                    = google_compute_subnetwork.managementsubnet.id 
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}