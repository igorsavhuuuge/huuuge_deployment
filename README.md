
## Prerequisites
This template requires `aws-iam-authenticator` and `openssl` to be installed

## Infrastructure Installation
cd aws_deployment
terraform init
terraform apply 

## Setup kubernetes services 
kubectl apply -f configs/metrics-server.yaml   --> to install metrics service
kubectl apply -f configs/autoscale_asg_nodes.yaml  --> to install autoscaller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.5/aio/deploy/recommended.yaml
kubectl apply -f configs/eks-admin-service-account.yaml
kubectl apply -f configs/config_map_aws_auth.yaml
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}') 

## install application 
cd .. 
kubectl apply -f huuuge_app_deployment/flask_namespace.yaml
kubectl apply -f huuuge_app_deployment/flask_deployment.yaml
kubectl apply -f huuuge_app_deployment/flask_service.yaml
kubectl apply -f huuuge_app_deployment/flask_ingress.yaml
kubectl autoscale deployment flask-deployment -n flask --cpu-percent=50 --min=3 --max=20
kubectl get hpa -n flask
