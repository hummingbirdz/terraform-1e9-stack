module "aks" {
  source = "./providers/az/aks"
  aks_prefix = var.az_aks_prefix
  rg_location = var.az_rg_location
  rg_name = var.az_rg_name
  service_principal_client_id = var.az_service_principal_client_id
  service_principal_client_secret = var.az_service_principal_client_secret
  agents_size = var.az_aks_node_pool_vm_size
  agents_count = var.az_aks_node_count
}

module "api" {
  source = "./application/services/api"
  image_pull_secrets = var.image_pull_secrets
  image_registry_url = var.api_image_registry_url
  pod_port = var.api_pod_port
  replicas = var.api_pod_replicas
}