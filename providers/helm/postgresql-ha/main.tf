# https://hub.helm.sh/charts/bitnami/postgresql-ha
resource "helm_release" "postgresql-ha" {
  name = "postgresql-ha"
  chart = "postgresql-ha"
  repository = "https://charts.bitnami.com/bitnami"
}

