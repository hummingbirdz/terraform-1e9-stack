# https://hub.helm.sh/charts/bitnami/mongodb-sharded
resource "helm_release" "mongodb-sharded" {
  name        = "mongodb-sharded"
  chart       = "mongodb-sharded"
  repository  = "https://charts.bitnami.com/bitnami"
}

