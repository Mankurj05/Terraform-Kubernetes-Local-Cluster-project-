resource "kubernetes_config_map" "app_config" {
  metadata {
    name      = "app-config"
    namespace = kubernetes_namespace.dev.metadata[0].name
  }

  data = {
    APP_NAME = "Terraform K8s Project"
  }
}
