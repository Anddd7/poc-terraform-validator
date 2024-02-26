module "pass" {
  source = "./modules/sample-app"

  groups = [
    "i-am-user-from-group-users",
    "i-am-user-from-group-admins",
  ]
}
