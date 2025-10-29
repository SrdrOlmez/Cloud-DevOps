# terraform/docker-nginx/main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  name  = "tf-nginx"
  image = docker_image.nginx.latest
  ports {
    internal = 80
    external = 8080
  }
}

