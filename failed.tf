module "failed" {
  source = "./modules/sample-app"

  groups = [
    "i-am-user-from-group-unknown"
  ]
}
