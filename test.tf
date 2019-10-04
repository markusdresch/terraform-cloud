provider "kubernetes" {
  host = "http://localhost:8000"
}

resource "null_resource" "custom" {
  # change trigger to run every time
  triggers = {
    build_number = "${timestamp()}"
  }

  # download kubectl
  provisioner "local-exec" {
    command = "curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && ls -lah"
  }

  # run kubectl
  provisioner "local-exec" {
    command = "./kubectl apply -f deployment.yaml"
  }
}
