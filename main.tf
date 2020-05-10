module "aks" {
  source = "./providers/az/aks"
  aks_prefix = var.az_aks_prefix
  rg_location = var.az_rg_location
  rg_name = var.az_rg_name
  service_principal_client_id = var.az_service_principal_client_id
  service_principal_client_secret = var.az_service_principal_client_secret
}