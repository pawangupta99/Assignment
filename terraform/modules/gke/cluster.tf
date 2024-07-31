resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.location

  initial_node_count = var.initial_node_count
  remove_default_node_pool = true 
  node_config {
    machine_type = var.machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}
resource "google_container_node_pool" "primary_nodes" {
  name       = var.node_pool_name
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = 2

  autoscaling {
    min_node_count = 2
    max_node_count = 5
  }

  node_config {
    machine_type = var.machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}