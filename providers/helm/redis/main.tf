# https://hub.helm.sh/charts/bitnami/redis
resource "helm_release" "redis" {
  name      = "redis"
  chart     = "redis"
  repository = "https://charts.bitnami.com/bitnami"
}

