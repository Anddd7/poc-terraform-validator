variable "groups" {
  type = list(string)

  validation {
    condition     = can([for group in var.groups : regex(".*-(users|admins)$", group)])
    error_message = "groups must end with -users or -admins."
  }
}

