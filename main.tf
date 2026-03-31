terraform {
  required_version = ">= 1.4.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
  }
}

# Configure the Kubernetes provider.
# In the GitHub Actions workflow, this will be configured via a Kubeconfig secret.
provider "kubernetes" {}

# This resource declaratively manages the OpenFaaS Function in Kubernetes.
resource "kubernetes_manifest" "hello_python_function" {
  manifest = {
    "apiVersion" = "openfaas.com/v1"
    "kind"       = "Function"
    "metadata" = {
      "name"      = "hello-python"
      # Assumes functions are deployed to the 'openfaas-fn' namespace.
      # Adjust if your OpenFaaS K8s setup is different.
      "namespace" = "openfaas-fn"
    }
    "spec" = {
      "name"  = "hello-python"
      "image" = "muzankibetsuji/hello-python:latest"
      # You can add labels, annotations, secrets, etc. here as needed.
    }
  }
}