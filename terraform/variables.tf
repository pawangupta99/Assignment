variable "project_id" {
  description = "The ID of the project in which to create the cluster"
  type        = string
  default     = "id-poc-430702"
}

variable "region" {
  description = "The region in which to create the cluster"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone in which to create the cluster"
  type        = string
  default     = "us-central1-a"
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
  default     = "id-cluster"
}

variable "initial_node_count" {
  description = "The number of nodes to create in the cluster"
  type        = number
  default     = 1
}

variable "machine_type" {
  description = "The machine type to use for cluster instances"
  type        = string
  default     = "c2-standard-4"
}

variable "node_pool_name" {
  description = "The name of the node pool"
  type        = string
  default     = "node-pool"
}

variable "preemptible" {
  description = "Use preemptible VMs for the node pool"
  type        = bool
  default     = false
}

variable "master_version" {
  description = "The Kubernetes master version to use for the cluster"
  type        = string
  default     = "latest"
}