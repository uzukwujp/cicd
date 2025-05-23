
###########


variable "cidr_block" {
    type = string
}

variable "instance_tenancy" {
    type = string 
}

variable "enable_dns_hostnames" {
    type = bool  
}

variable "tag" {
    type = string
}

variable "region" {
 type = string  
}

variable "cluster_name" {
    type = string  
}

variable "cluster_role_name" {
    type = string 
}

variable "az_count" {
    type = number  
}

variable "node_group_name" {
    type = string  
}

variable "instance_types" {
    type = list(string)
}

variable "capacity_type" {
    type = string
}

variable "desired_size" {
    type = number  
}

variable "max_size" {
    type = number
}

variable "max_unavailable" {
    type = number
}

variable "min_size" {
    type = number  
}

variable "worker_node_iam_role_name" {
   type = string  
}

variable "addons" {
  type = list(map(string))
}

# variable "karpenter_version" {
#     type = string
#     description = "karpenter helm chart version"  
# }

variable "chart_version" {
    type        = string
    description = "The exact chart version of helm chart"  
}

variable "custom_values" {
    type        = string
    description = "file path to custom helm values file"  
}

variable "cluster_version" {
  type = string  
}

variable "repository_names" {
   type = list(map(string))
   description = "names of private ecr repository names"  
}

variable "nginx_version" {
   type = string
   description = "chart version for nginx ingress controller"  
}

variable "nginx_values" {
    type = string
    description = "file path to the nginx helm values file"  
}




