resource "random_password" "pwd" {
  length           = var.length
  special          = var.special
  override_special = var.override_special
}
