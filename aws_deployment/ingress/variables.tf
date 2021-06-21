variable "name" {
  description = "the name of your application"
}

variable "environment" {
  description = "environment name"}

variable "region" {
  description = "the AWS region in which resources are created"
}

variable "vpc_id" {
  description = "The VPC the cluser should be created in"
}

variable "cluster_id" {
  description = "The ID of the cluster where the ingress controller should be attached"
}
