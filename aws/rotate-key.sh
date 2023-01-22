terraform output secret
terraform destroy -target aws_iam_access_key.key -auto-approve
terraform apply -auto-approve
cp credentials ~/.aws/credentials
terraform output secret