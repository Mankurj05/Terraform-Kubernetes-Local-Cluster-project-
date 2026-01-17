resource "kubernetes_deployment" "app" {
  metadata {
    name      = "terraform-app"
    namespace = kubernetes_namespace.dev.metadata[0].name
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "terraform-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "terraform-app"
        }
      }

      spec {
        container {
          name  = "app"
          image = "terraform-k8s-app:1.0"

          port {
            container_port = 80
          }

          env_from {
            config_map_ref {
              name = kubernetes_config_map.app_config.metadata[0].name
            }
          }
        }
      }
    }
  }
}
