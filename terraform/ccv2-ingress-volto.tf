resource "kubernetes_ingress_v1" "ccv_2__volto" {
  metadata {
    name = "ccv2-volto"

    annotations = {
      "cert-manager.io/issuer" = "letsencrypt-staging"

      "kubernetes.io/ingress.class" = "nginx"

      "nginx.ingress.kubernetes.io/auth-realm" = "https://beta2.climate-change.data.gov.uk"

      "nginx.ingress.kubernetes.io/auth-secret" = "beta-auth"

      "nginx.ingress.kubernetes.io/auth-type" = "basic"

      "nginx.ingress.kubernetes.io/proxy-body-size" = "100m"

      "nginx.ingress.kubernetes.io/server-snippet" = "gzip on;\n"
    }
  }

  spec {
    tls {
      hosts       = ["beta2.climate-change.data.gov.uk"]
      secret_name = "beta2-cert"
    }

    rule {
      host = "beta2.climate-change.data.gov.uk"

      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "volto"

              port {
                number = 3000
              }
            }
          }
        }
      }
    }
  }
}

