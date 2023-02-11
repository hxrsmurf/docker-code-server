FROM alpine

RUN apk update
RUN apk add wget curl unzip jq bash

RUN mkdir /tmp/zips

RUN cd /tmp/zips && \
    wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip

RUN cd /tmp/zips && \
    curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip

COPY terraform.sh /tmp/terraform.sh

RUN chmod +x /tmp/terraform.sh && run /tmp/terraform.sh

RUN wget -O /tmp/b2 https://github.com/Backblaze/B2_Command_Line_Tool/releases/latest/download/b2-linux && chmod +x /tmp/b2