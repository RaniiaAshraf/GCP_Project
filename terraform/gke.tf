
resource "google_container_cluster" "private-cluster" {
  name                     = var.cluster-name
  location                 = var.cluster-location 
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.myvpc.self_link
  subnetwork               = google_compute_subnetwork.restrictedsubnet.self_link


 release_channel {
    channel = "REGULAR"
  }

 ip_allocation_policy {
    cluster_secondary_range_name  = var.pod-name
    services_secondary_range_name = var.service-range-name 
  }

  private_cluster_config {
    
    enable_private_nodes    = true   
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.0/28" 

  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = var.subnetcidr 
      display_name = var.authorized-name 
    }
  }
}


resource "google_container_node_pool" "private-cluster-nodes" {
  name       = var.node-name
  cluster    = google_container_cluster.private-cluster.id
  location   = var.cluster-location 
  node_count = 1

  node_config {
    preemptible  = true 
    machine_type = var.node-type
    service_account = google_service_account.gke-sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

 
}