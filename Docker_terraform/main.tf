terraform {
required_providers {
docker = {
source = "kreuzwerker/docker"
version = "~> 3.0.1"
  }
 }
}
provider "docker" {}
// Create Image for a Container
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}
// Create a Container with above image
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name = "Web1"  
  ports {
    internal = 80
    external = 8001
  }
}
