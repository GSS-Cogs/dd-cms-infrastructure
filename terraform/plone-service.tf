resource "kubernetes_service" "plone_service" {
  metadata {
    name = "plone-service"
  }

  spec {
    port {
      port        = 8080
      target_port = "8080"
    }

    selector = {
      app = "redis"

      role = "leader"

      tier = "backend"
    }
  }
}

