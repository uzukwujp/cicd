variable "nginx_version" {
  type = string
  description = "The chart version of nginx ingress controller"  
}

variable "nginx_values" {
  type = string
  description = "The helm values file for nginx"  
}