# Use terraform output to display connection strings.
output "connection_strings" {
  value = "mongodbatlas_cluster.Cluster_name.connection_strings"
}