# AKS cluster name 
output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks-cluster.name
  description = "Name of the AKS Cluster"
}

# AKS Cluster ID
output "kubernetes_cluster_id" {
  value = azurerm_kubernetes_cluster.aks-cluster.id
  description = "ID of the AKS Cluster"
}

# FQDN of nodes
output "kubernetes_cluster_fqdn" {
  value = azurerm_kubernetes_cluster.aks-cluster.fqdn
}

# ACR ID
output "acr_id" {
  value = azurerm_container_registry.acr.id
}

# kubeconfig file
resource "local_file" "kubeconfig" {
  depends_on   = [azurerm_kubernetes_cluster.aks-cluster]
  filename     = "kubeconfig"
  content      = azurerm_kubernetes_cluster.aks-cluster.kube_config_raw
}