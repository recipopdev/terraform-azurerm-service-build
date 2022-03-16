resource "azurerm_container_registry" "main" {
  name                = var.service
  resource_group_name = var.resource_group
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "docker_registry_image" "main" {
  name = "${azurerm_container_registry.main.login_server}:${var.tag}"

  build {
    context    = "${var.build.path}/"
    build_args = var.build.args
    labels     = var.build.labels
    platform   = var.platform
    memory     = var.memory

    auth_config {
      user_name = azurerm_container_registry.main.admin_username
      password  = azurerm_container_registry.main.admin_password
      host_name = azurerm_container_registry.main.login_server
    }
  }
}