module "failed" {
  source = "./modules/sample-app"

  groups = [
    "i-am-user-from-group-unknown"
  ]
  cluster_name = "aws-uswe2-qa01"
  namespace_names = {
    "special-char-*" = {
      container_limits_cpu      = "100m"
      container_limits_memory   = "128Mi"
      container_requests_cpu    = "100m"
      container_requests_memory = "128Mi"
      custom_labels = [
        {
          label = "app"
          value = "none"
        },
      ]
    },
    "too-long-namespace-name-which-is-more-than-63-characters" = {
      container_limits_cpu      = "100m"
      container_limits_memory   = "128Mi"
      container_requests_cpu    = "100m"
      container_requests_memory = "128Mi"
      custom_labels = [
        {
          label = "app"
          value = "unknown"
        },
      ]
    },
  }
}
