#####
# Locals
#####

locals {
  application_version = ""
  labels = {
    "app.kubernetes.io/name"       = "alertmanager-webhook-servicenow"
    "app.kubernetes.io/component"  = "exporter"
    "app.kubernetes.io/part-of"    = "monitoring"
    "app.kubernetes.io/managed-by" = "terraform"
    "app.kubernetes.io/version"    = local.application_version
  }
}

#####
# Randoms
#####

resource "random_string" "selector" {
  special = false
  upper   = false
  number  = false
  length  = 8
}

#####
# Deployment
#####

resource "kubernetes_deployment" "this" {
  count = var.enabled ? 1 : 0

  metadata {
    name      = var.deployment_name
    namespace = var.namespace
    annotations = merge(
      var.annotations,
      var.deployment_annotations
    )
    labels = merge(
      {
        "app.kubernetes.io/instance" = var.deployment_name
      },
      local.labels,
      var.labels,
      var.deployment_labels
    )
  }

  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        app = random_string.selector.result
      }
    }
    template {
      metadata {
        annotations = merge(
          var.annotations,
          var.deployment_annotations
        )
        labels = merge(
          {
            "app.kubernetes.io/instance" = var.deployment_name
            app                          = random_string.selector.result
          },
          local.labels,
          var.labels,
          var.deployment_labels
        )
      }
      spec {
        volume {
          name = "configuration-volume"
          config_map {
            name = element(concat(kubernetes_config_map.this.*.metadata.0.name, list("")), 0)
          }
        }

        container {
          name              = "alertmanager-webhook-servicenow"
          image             = "fxinnovation/:${local.application_version}"
          image_pull_policy = var.image_pull_policy

          volume_mount {
            name       = "configuration-volume"
            mount_path = "/data"
          }

          port {
            name           = "http"
            container_port = 9876
            protocol       = "TCP"
          }

          env {
            name = "AWSN_SERVICE_NOW_INSTANCE_NAME"
            value_from {
              secret_key_ref {
                name = element(concat(kubernetes_secret.this.*.metadata.0.name, list("")), 0)
                key  = "instance_name"
              }
            }
          }

          env {
            name = "AWSN_SERVICE_NOW_USER_NAME"
            value_from {
              secret_key_ref {
                name = element(concat(kubernetes_secret.this.*.metadata.0.name, list("")), 0)
                key  = "user_name"
              }
            }
          }

          env {
            name = "AWSN_SERVICE_NOW_PASSWORD"
            value_from {
              secret_key_ref {
                name = element(concat(kubernetes_secret.this.*.metadata.0.name, list("")), 0)
                key  = "password"
              }
            }
          }

          resources {
            requests {
              memory = "64Mi"
              cpu    = "50m"
            }
            limits {
              memory = "128Mi"
              cpu    = "100m"
            }
          }
        }
      }
    }
  }
}

#####
# Service
#####

resource "kubernetes_service" "this" {
  count = var.enabled ? 1 : 0

  metadata {
    name      = var.service_name
    namespace = var.namespace
    annotations = merge(
      var.annotations,
      var.service_annotations
    )
    labels = merge(
      {
        "app.kubernetes.io/instance" = var.service_name
      },
      local.labels,
      var.labels,
      var.service_labels
    )
  }

  spec {
    selector = {
      app = random_string.selector.result
    }
    type = "ClusterIP"
    port {
      port        = var.port
      target_port = "http"
      protocol    = "TCP"
      name        = "http"
    }
  }
}

#####
# ConfigMap
#####

resource "kubernetes_config_map" "this" {
  count = var.enabled ? 1 : 0

  metadata {
    name      = var.config_map_name
    namespace = var.namespace
    annotations = merge(
      var.annotations,
      var.config_map_annotations
    )
    labels = merge(
      {
        "app.kubernetes.io/instance" = var.config_map_name
      },
      local.labels,
      var.labels,
      var.config_map_labels
    )
  }

  data = {
    "configuration.yaml" = local.configuration_yaml
  }
}

#####
# Secret
#####
