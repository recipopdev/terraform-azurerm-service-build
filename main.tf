resource "docker_registry_image" "main" {
  name = "${azurerm_container_registry.main.login_server}/${var.service}:${var.tag}"

  build {
    context    = "${var.build.path}/"
    build_args = var.build.args
    labels     = var.build.labels
    platform   = var.platform
  }
}