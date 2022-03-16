variable "service" {
  description = "The name of the service being built"
  type        = string
}

variable "resource_group" {
  description = "The name of the resource group in Azure"
  type        = string
}

variable "tag" {
  description = "The tag to attach to the service being built"
  type        = string
}

variable "build" {
  description = "The details of the build of the service"
  type        = object({
    path   = string
    labels = map(string)
    args   = map(string)
  })
}

variable "platform" {
  description = "The platform of the container"
  type        = string
  default     = "linux/amd64"
}

variable "memory" {
  description = "The memory used for the build"
  type        = number
  default     = 2048
}