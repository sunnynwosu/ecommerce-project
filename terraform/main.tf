resource "azurerm_resource_group" "ecommerce_rg" {
    name = var.resource_group_name
    location = var.location 
}

resource "azurerm_container_registry" "acr" {
    name = var.acr_name
    resource_group_name = azurerm_resource_group.ecommerce_rg.name
    location = azurerm_resource_group.ecommerce_rg.location
    sku = "Basic"
    admin_enabled = true
}

resource "azurerm_kubernetes_cluster" "ecommerce_aks" {
    name = var.aks_cluster_name
    location = azurerm_resource_group.ecommerce_rg.location
    resource_group_name = azurerm_resource_group.ecommerce_rg.name
    dns_prefix = "ecommerce"

    default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "aks_acr_pull" {
    principal_id = azurerm_kubernetes_cluster.ecommerce_aks.kubelet_identity[0].object_id
    role_definition_name = "AcrPull"
    scope = azurerm_container_registry.acr.id 
}
