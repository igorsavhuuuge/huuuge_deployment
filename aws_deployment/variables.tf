variable "name" {
  description = "the name of your application"
  default     = "eks"
}

variable "environment" {
  description = "environment name"
  default     = "test"
}

variable "region" {
  description = "AWS region name"
  default     = "eu-central-1"
}

variable "profile" {
  description = "AWS profile name"
//  default     = "disaster-recovery"
}

variable "availability_zones" {
  description = "List of availability zones"
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "List of private subnets"
  default     = ["10.0.0.0/20", "10.0.32.0/20"]
}

variable "public_subnets" {
  description = "List of public subnets"
  default     = ["10.0.16.0/20", "10.0.48.0/20"]
}

variable "kubeconfig_path" {
  description = "Path where the config file for kubectl should be written to"
  default     = "~/.kube"
}

variable "k8s_version" {
  description = "kubernetes version"
  default = ""
}
