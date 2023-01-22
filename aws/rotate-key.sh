terraform output secret
terraform destroy -target aws_iam_access_key.key -auto-approve
terraform apply -auto-approve
terraform output secret