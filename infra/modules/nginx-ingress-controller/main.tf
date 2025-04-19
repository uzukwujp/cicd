
resource "helm_release" "argocd" {
  name             = "nginx-ingress-controller"
  repository       = "https://helm.nginx.com/stable"
  chart            = "nginx-ingress"
  version          = var.nginx_version
  namespace        = "nginx"
  create_namespace = true
  values           = var.nginx_values != "" ? [file("${path.root}/${var.nginx_values}")] : []  
}


