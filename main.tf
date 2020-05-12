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

provider kubernetes {
  load_config_file = false

  host                   = module.aks.kube_host
  client_key             = module.aks.kube_client_key
  client_certificate     = module.aks.kube_client_certificate
  cluster_ca_certificate = module.aks.kube_cluster_ca_certificate
}

resource "kubernetes_secret" "image_pull_secrets" {
  metadata {
    name = "regcred"
  }

  data = {
    ".dockercfg" = jsonencode({
      "registry.gitlab.com" = {
        username = var.gitlab_username
        password = var.gitlab_password
      }
    })
  }

  type = "kubernetes.io/dockercfg"
}

module "api" {
  source = "./application/services/api"
  image_pull_secrets = kubernetes_secret.image_pull_secrets.metadata.0.name
  image_registry_url = var.api_image_registry_url
  pod_port = var.api_pod_port
  replicas = var.api_pod_replicas
}

module "frontend" {
  source = "./application/services/frontend"
  image_pull_secrets = kubernetes_secret.image_pull_secrets.metadata.0.name
  image_registry = var.frontend_image_registry_url
  pod_port = var.frontend_pod_port
  replicas = var.frontend_replicas
}