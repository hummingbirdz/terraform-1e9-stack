# https://hub.helm.sh/charts/bitnami/postgresql
resource "helm_release" "postgresql" {
  name = "postgresql"
  chart = "postgresql"
  repository = "https://charts.bitnami.com/bitnami"
}


