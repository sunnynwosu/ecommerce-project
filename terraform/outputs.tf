output "aks_cluster_name" {
    value = azurerm_kubernetes_cluster.ecommerce_aks.name
}

output "acr_login_server" {
    value = azurerm_container_registry.acr.login_server
}