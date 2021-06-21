
## Prerequisites
This template requires `aws-iam-authenticator` and `openssl` to be installed

## Infrastructure Installation

1) terraform init
2) terraform apply 

## Setup kubernetes services 
kubectl apply -f configs/metrics-server.yaml   --> to install metrics service
kubectl apply -f configs/autoscale_asg_nodes.yaml  --> to install autoscaller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.5/aio/deploy/recommended.yaml
kubectl apply -f configs/eks-admin-service-account.yaml
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')            

#4) kubectl apply -f configs/config_map_aws_auth.yaml
#5) kubectl apply -f configs/eks-admin-service-account.yaml

https://github.com/starchx/devlab-eks-alb-2048game
