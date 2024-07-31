
# This moduel will create the GKE cluster. 
module "gke_cluster" {
  source = "./modules/gke"

  cluster_name       = var.cluster_name
  location           = var.zone
  initial_node_count = var.initial_node_count
  machine_type       = var.machine_type
  node_pool_name     = var.node_pool_name
  preemptible        = var.preemptible
  master_version     = var.master_version
}

