# https://hub.helm.sh/charts/nginx/nginx-ingress
resource "helm_release" "nginx-ingress" {
  name = "nginx-ingress"
  chart = "nginx-ingress"
  repository = "https://helm.nginx.com/stable"
}

