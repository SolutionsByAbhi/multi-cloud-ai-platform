terraform  {
    required_version  =  ">=  1.5.0"

    required_providers  {
        azurerm  =  {
            source    =  "hashicorp/azurerm"
            version  =  "~>  4.0"
        }
    }

    backend  "azurerm"  {
        resource_group_name    =  "rg-mcai-tfstate"
       storage_account_name  =  "mcaistatestorage"
        container_name              =  "tfstate"
        key                                    =  "azure/dev/terraform.tfstate"
    }
}

provider  "azurerm"  {
    features  {}
}

locals  {
    name  =  "mcai-azure-${var.env}"
    tags  =  {
        Project          =  "multi-cloud-ai-platform"
        Environment  =  var.env
       Cloud              =  "azure"
    }
}

resource  "azurerm_kubernetes_cluster"  "this"  {
    name                                =  "${local.name}-aks"
    location                        =  var.location
    resource_group_name  =  var.resource_group_name
    dns_prefix                    =  "${local.name}-dns"

    default_node_pool  {
        name             =  "system"
        node_count  =  1
        vm_size        =  "Standard_D4s_v3"
    }

    identity  {
        type  =  "SystemAssigned"
    }

    tags  =  local.tags
}

resource  "azurerm_kubernetes_cluster_node_pool"  "gpu"  {
    name                                    =  "gpu"
    kubernetes_cluster_id  =  azurerm_kubernetes_cluster.this.id
    vm_size                             =  "Standard_NC4as_T4_v3"
    node_count                        =  1
    mode                                    =  "User"

    tags  =  local.tags
}
