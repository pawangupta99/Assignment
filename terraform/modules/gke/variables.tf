variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
}

variable "location" {
  description = "The location (region or zone) for the cluster"
  type        = string
}

variable "initial_node_count" {
  description = "The number of nodes to create in the cluster"
  type        = number
}

variable "machine_type" {
  description = "The machine type to use for cluster instances"
  type        = string
}

variable "node_pool_name" {
  description = "The name of the node pool"
  type        = string
}

variable "preemptible" {
  description = "Use preemptible VMs for the node pool"
  type        = bool
}

variable "master_version" {
  description = "The Kubernetes master version to use for the cluster"
  type        = string
}
