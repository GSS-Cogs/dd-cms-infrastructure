resource "kubernetes_deployment" "volto" {
  metadata {
    name = "volto"

    labels = {
      "io.kompose.service" = "volto"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        "io.kompose.service" = "volto"
      }
    }

    template {
      metadata {
        labels = {
          "io.kompose.service" = "volto"
        }
      }

      spec {
        container {
          name  = "volto"
          image = "europe-west2-docker.pkg.dev/optimum-bonbon-257411/ccv2/volto"

          env {
            name  = "NODE_ENV"
            value = "production"
          }
        }

        restart_policy = "Always"
      }
    }
  }
}

