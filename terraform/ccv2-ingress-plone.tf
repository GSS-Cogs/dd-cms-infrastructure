resource "kubernetes_ingress_v1" "ccv_2__plone" {
  metadata {
    name = "ccv2-plone"

    annotations = {
      "cert-manager.io/issuer" = "letsencrypt-staging"

      "kubernetes.io/ingress.class" = "nginx"

      "nginx.ingress.kubernetes.io/proxy-body-size" = "100m"

      "nginx.ingress.kubernetes.io/rewrite-target" = "/VirtualHostBase/https/beta2.climate-change.data.gov.uk/Plone/++api++/VirtualHostRoot/$1"

      "nginx.ingress.kubernetes.io/server-snippet" = "gzip on;\n"

      "nginx.ingress.kubernetes.io/use-regex" = "true"
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
          path      = "/\\+\\+api\\+\\+($|/.*)"
          path_type = "Prefix"

          backend {
            service {
              name = "plone"

              port {
                number = 8080
              }
            }
          }
        }
      }
    }
  }
}

