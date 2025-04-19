
module "vpc" {
  source                  = "./modules/vpc"
  cidr_block              =  var.cidr_block
  instance_tenancy        =  var.instance_tenancy
  enable_dns_hostnames    =  var.enable_dns_hostnames
  az_count                =  var.az_count
  tag                     =  var.tag
  cluster_name            =  var.cluster_name
}

module "ecr" {
  source                  = "./modules/ecr"
  for_each                = { for idx, repo_name in var.repository_names : idx => repo_name }
  repository_names        = each.value.repo_name
}

module "eks_control_plane" {
  source                   = "./modules/eks/control_plane"
  cluster_name             =  var.cluster_name
  cluster_role_name        =  var.cluster_role_name
  cluster_version          =  var.cluster_version
  private_subnet_ids       =  module.vpc.private_subnet_ids
  depends_on               =  [ module.vpc ]
}

module "eks_worker_node" {
  source                    = "./modules/eks/worker_node"
  node_group_name           =  var.node_group_name
  private_subnet_ids        =  module.vpc.private_subnet_ids
  desired_size              =  var.desired_size
  kubernetes_version        =  var.cluster_version
  max_size                  =  var.max_size
  max_unavailable           =  var.max_unavailable
  min_size                  =  var.min_size
  cluster_name              =  var.cluster_name
  capacity_type             =  var.capacity_type
  instance_types            =  var.instance_types
  worker_node_iam_role_name =  var.worker_node_iam_role_name
  depends_on                = [ module.eks_control_plane]  
}

module "eks_addons" {
  source                   = "./modules/eks/eks_addons"
  for_each                 = { for idx, addon in var.addons : idx => addon }    
  cluster_name             = module.eks_control_plane.cluster_name
  addon_name               = each.value.addon_name
  addon_version            = each.value.addon_version
  depends_on               = [ module.eks_worker_node ]
}

module "argocd" {
  source        = "./modules/argocd"
  chart_version = var.chart_version
  custom_values = var.custom_values
  depends_on    = [ module.eks_worker_node ]  
}

module "nginx-ingress-controller" {

  source        = "./modules/nginx-ingress-controller"
  nginx_version = var.nginx_version
  nginx_values  = var.nginx_values  
}

