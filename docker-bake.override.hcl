variable "REGISTRY" {
  default = "docker.io"
}

target "default" {
  inherits = ["shared"]
  args = {
    BUILD_TITLE = "Homekit Wiz Bulbs Bridge"
    BUILD_DESCRIPTION = "Control your Wiz bulbs with HomeKit"
  }
  tags = [
    "${REGISTRY}/dubodubonduponey/homekit-wiz",
  ]
}
