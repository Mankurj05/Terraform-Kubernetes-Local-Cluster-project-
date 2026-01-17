resource "kubernetes_service" "app_service" {
  metadata {
    name      = "terraform-service"
    namespace = kubernetes_namespace.dev.metadata[0].name
  }

  spec {
    selector = {
      app = "terraform-app"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}
