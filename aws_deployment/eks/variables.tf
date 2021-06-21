variable "name" {
  description = "the name of your application"}

variable "environment" {
  description = "environment name"
}
variable "aws_region" {
  description = "AWS region name"
  default = "eu-central-1"
}

variable "region" {
  description = "AWS region name"
}

variable "k8s_version" {
  description = "Kubernetes version."
}

variable "vpc_id" {
  description = "The VPC the cluser should be created in"
}

variable "private_subnets" {
  description = "List of private subnet IDs"
}

variable "public_subnets" {
  description = "List of public subnet IDs"
}

variable "kubeconfig_path" {
  description = "kubectl should config file"
}

variable "profile" {
  description = "AWS profile name"
//  default     = "disaster-recovery"
}
