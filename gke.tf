

resource "google_container_cluster" "primary" {
  name     = var.cluster
  location = var.region

  initial_node_count = 2

  node_config {
    machine_type = "n1-standard-1"
    disk_size_gb = 20
  }
}
