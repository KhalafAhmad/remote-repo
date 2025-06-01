terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
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
  image    = docker_image.nginx.image_id
  name     = "Web1"
  hostname = "web_server1"
  dns      = ["192.168.1.1", "8.8.8.8"]
  network_advanced {
    name       = docker_network.New_Network.id
    depends_on = [docker_network.New_Network]

  }
  ports {
    internal = 80
    external = 8001
  }
}
//create a custom network in docker to use it with our container 
resource "docker_network" "New_Network" {
  name = "terraform_network"
  ipam_config {
    aux_address = {}
    gateway     = "12.12.12.1"
    ip_range    = ""
    subnet      = "12.12.12.0/24"
  }


}
