resource "kubernetes_deployment" "proxy" {
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
    replicas = 1

    selector {
      match_labels = {
        "io.kompose.service" = "proxy"
      }
    }

    template {
      metadata {
        labels = {
          "io.kompose.network/test-net" = "true"

          "io.kompose.service" = "proxy"
        }

        annotations = {
          "kompose.cmd" = "kompose convert"

          "kompose.version" = "1.26.1 (a9d05d509)"
        }
      }

      spec {
        container {
          name  = "proxy"
          image = "climate-change-v2_proxy"

          port {
            container_port = 80
          }

          image_pull_policy = "Never"
        }

        restart_policy = "Always"
      }
    }
  }
}

