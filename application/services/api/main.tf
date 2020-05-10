resource "kubernetes_deployment" "api" {
  metadata {
    name = "api"
    namespace = "default"
    labels = {
      deployment = "api"
    }
  }
  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        deployment = "api"
      }
    }
    template {
      metadata {
        labels = {
          deployment = "api"
        }
      }
      spec {
        # Ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/
        image_pull_secrets {
          name = var.image_pull_secrets
        }
        container {
          name = "api"
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

resource "kubernetes_service" "api-service" {
  metadata {
    name = "api"
    labels = {
      service = "api"
    }
  }
  spec {
    type = "LoadBalancer"
    selector = {
      deployment = "api"
    }
    port {
      port = var.pod_port
    }
  }
}

resource "kubernetes_config_map" "api-config-map" {
  metadata {
    name = "api-config-map"
  }
  //  TODO Add terrafora map config that can be past in.
  data = {
  }
}
