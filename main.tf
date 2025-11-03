terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_network" "app_net" {
  name = "terraform_network"
}

resource "docker_image" "nginx" {
  name        = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "web" {
  name  = "terraform-nginx"
  image = docker_image.nginx.name

  networks_advanced {
    name = docker_network.app_net.name
  }

  ports {
    internal = 80
    external = var.exposed_port
  }

  # "User Data"
  command = [
    "bash", "-c",
    "echo '<h1>Hola desde Terraform 👋</h1><p>Este contenedor fue creado con IaC para que cumpliera con lo pedido</p>' > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"
  ]
}
