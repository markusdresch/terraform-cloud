provider "kubernetes" {
  host = "http://localhost:8000"
}

resource "null_resource" "custom" {
  provisioner "local-exec" {
    command = "kubectl apply -f https://raw.githubusercontent.com/Azure/aad-pod-identity/master/deploy/infra/deployment.yaml"
  }
}
