resource "kubernetes_service" "proxy" {
  metadata {
    name = "proxy"

    labels = {
      "io.kompose.service" = "proxy"
    }

    annotations = {
      "kompose.cmd" = "kompose convert"

      "kompose.version" = "1.26.1 (a9d05d509)"
    }
  }

  spec {
    port {
      name        = "80"
      port        = 80
      target_port = "80"
    }

    selector = {
      "io.kompose.service" = "proxy"
    }
  }
}

