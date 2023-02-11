FROM alpine

RUN apk update
RUN apk add wget curl unzip bash

RUN mkdir /tmp/zips

RUN cd /tmp/zips && \
    wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip

RUN cd /tmp/zips && \
    curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip

RUN cd /tmp && curl -L https://releases.hashicorp.com/terraform/index.json \
            | jq -r '.versions[].version' \
            | grep -v beta \
            | grep -v alpha \
            | sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n \
            | tail -1 \
            | xargs -I {} curl -L https://releases.hashicorp.com/terraform/{}/terraform_{}_linux_amd64.zip -o terraform.zip && \
            unzip -q terraform.zip

RUN wget -O /tmp/b2 https://github.com/Backblaze/B2_Command_Line_Tool/releases/latest/download/b2-linux && chmod +x /tmp/b2