terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}
provider "docker" {}
// crate a volume and attached it to a contaienr
resource "docker_volume" "www_data1" {
    name = var.volume_name
}
output "TheNameOfVolume"{
value= docker_volume.www_data1.name
}
variable "volume_name" {
   type = string
 }
