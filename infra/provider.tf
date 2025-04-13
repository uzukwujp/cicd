
provider "aws" {
  region = var.region
}


provider "helm" {
  kubernetes {
    host                   = module.eks_control_plane.endpoint
    cluster_ca_certificate = base64decode(module.eks_control_plane.kubeconfig-certificate-authority-data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.eks_control_plane.cluster_name]
      command     = "aws"
    }
  }
}
