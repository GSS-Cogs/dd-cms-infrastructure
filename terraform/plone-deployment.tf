resource "kubernetes_deployment" "plone" {
  metadata {
    name = "plone"

    labels = {
      "io.kompose.service" = "plone"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        "io.kompose.service" = "plone"
      }
    }

    template {
      metadata {
        labels = {
          "io.kompose.service" = "plone"
        }
      }

      spec {
        container {
          name  = "plone"
          image = "europe-west2-docker.pkg.dev/optimum-bonbon-257411/ccv2/plone"

          port {
            container_port = 8080
          }
        }

        restart_policy = "Always"
        dns_policy     = "Default"
      }
    }
  }
}

