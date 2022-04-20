provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Start a container
resource "docker_container" "nginx" {
  name  = var.container_name
  image = docker_image.nginx.latest
}

# Find the latest Ubuntu precise image.
resource "docker_image" "nginx" {
  name = var.container_image
  keep_locally = true
}
