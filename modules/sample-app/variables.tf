variable "groups" {
  type = list(string)

  validation {
    condition     = can([for group in var.groups : regex(".*-(users|admins)$", group)])
    error_message = "groups must end with -users or -admins."
  }
}

variable "cluster_name" {
  type = string

  validation {
    condition     = can(regex("aws-(usea1|uswe2|euw1|apne1|apse1)(-[a-z]{3})?-(prod|preprod)[0-9]{2}", var.cluster_name))
    error_message = "cluster_name follow the naming convention `aws-{region}-{environment}{number}` or `aws-{region}-{product}-{environment}{number}`."
  }
}


variable "namespace_names" {
  type = map(object({
    container_limits_cpu      = optional(string)
    container_limits_memory   = optional(string)
    container_requests_cpu    = optional(string)
    container_requests_memory = optional(string)
    custom_labels = list(object({
      label = string
      value = string
    }))
  }))

  validation {
    condition     = can([for k, v in var.namespace_names : regex("^[a-z0-9-]{1,63}$", k)])
    error_message = "namespace_names keys must be lowercase, alphanumeric characters or '-', and must be no more than 63 characters."
  }

  validation {
    # validate value should be none/small if label=app in custom_labels
    condition = alltrue([
      for k, v in var.namespace_names : alltrue([
        for label in v.custom_labels : label.label == "app" && label.value == "none" || label.value == "small"
      ])
    ])
    # print error msg with color red and blob
    error_message = "namespace_names custom_labels value should be \u001b[31mnone\u001b[0m or \u001b[31msmall\u001b[0m if \u001b[1mlabel=app\u001b[0m."
  }
}
