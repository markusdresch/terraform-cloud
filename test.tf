provider "kubernetes" {
  host = "http://localhost:8000"
}

resource "null_resource" "custom" {
  # download kubectl
  provisioner "local-exec" {
    command = "curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
  }
  provisioner "local-exec" {
    command = "./kubectl apply -f https://raw.githubusercontent.com/Azure/aad-pod-identity/master/deploy/infra/deployment.yaml"
  }
}
