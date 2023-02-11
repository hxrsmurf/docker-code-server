#!/bin/bash
cd /tmp
curl -L https://releases.hashicorp.com/terraform/index.json \
            | jq -r '.versions[].version' \
            | grep -v beta \
            | grep -v alpha \
            | sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n \
            | tail -1 \
            | xargs -I {} curl -L https://releases.hashicorp.com/terraform/{}/terraform_{}_linux_amd64.zip -o terraform.zip
unzip -q terraform.zip