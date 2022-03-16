terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.16.0"
    }
    azurerm = {
      version = "~> 2.99.0"
    }
  }
}
