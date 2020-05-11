variable "az_aks_prefix" {}
variable "az_rg_location" {}
variable "az_rg_name" {}
variable "az_service_principal_client_id" {}
variable "az_service_principal_client_secret" {}
variable "az_aks_node_pool_vm_size" {
  description = "Size of VM used for the cluster nodes"
  default = "Standard_B2ms"
}
variable "az_aks_node_count" {
  description = "Number of nodes in the cluster"
  default = 1
}
variable "api_image_registry_url" {}
variable "api_pod_port" {}
variable "api_pod_replicas" {}
variable "gitlab_email" {}
variable "gitlab_username" {}
variable "gitlab_password" {}