resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend"
    namespace = "default"
    labels = {
      deployment = "frontend"
    }
  }
  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        deployment = "frontend"
      }
    }
    template {
      metadata {
        labels = {
          deployment = "frontend"
        }
      }
      spec {
        # Ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/
        image_pull_secrets {
          name = var.image_pull_secrets
        }
        container {
          name = "frontend"
          image = var.image_registry
          image_pull_policy = "Always"
          port {
            container_port = var.pod_port
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "frontend-service" {
  metadata {
    name = "frontend"
    labels = {
      service = "frontend"
    }
  }
  spec {
    type = "LoadBalancer"
    selector = {
      deployment = "frontend"
    }
    port {
      port = var.pod_port
    }
  }
}

resource "kubernetes_config_map" "frontend-config-map" {
  metadata {
    name = "frontend-config-map"
  }
  //  TODO Add terrafora map config that can be past in.
  data = {
  }
}

