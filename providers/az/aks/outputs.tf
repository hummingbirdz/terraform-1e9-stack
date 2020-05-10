output "kube_host" {
  value = module.aks.host
}

output "kube_client_key" {
  value = base64decode(module.aks.client_key)
}

output "kube_client_certificate" {
  value = base64decode(module.aks.client_certificate)
}

output "kube_cluster_ca_certificate" {
  value = base64decode(module.aks.cluster_ca_certificate)
}
