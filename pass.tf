module "pass" {
  source = "./modules/sample-app"

  groups = [
    "i-am-user-from-group-users",
    "i-am-user-from-group-admins",
  ]

  cluster_name = "aws-uswe2-preprod01"
  namespace_names = {
    "namespace1" = {
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
    "namespace1-sub-apps" = {
      container_limits_cpu      = "100m"
      container_limits_memory   = "128Mi"
      container_requests_cpu    = "100m"
      container_requests_memory = "128Mi"
      custom_labels = [
        {
          label = "app"
          value = "small"
        },
      ]
    },
  }
}
