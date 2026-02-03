output  "aks_name"  {
    value  =  azurerm_kubernetes_cluster.this.name
}

output  "location"  {
    value  =  var.location
}
