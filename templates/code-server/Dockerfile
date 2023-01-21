FROM "codercom/code-server:latest"
USER root

RUN apt-get update && apt-get install docker-compose -yf
RUN apt-get update && apt-get install docker-compose curl wget unzip vim git python3 python3-pip -yf
RUN mkdir /tmp/zips
RUN cd /tmp/zips && \
    wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip

RUN cd /tmp/zips && \
    curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip

RUN cd /tmp && curl https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip -o terraform.zip && unzip terraform.zip && mv terraform /usr/bin/terraform

RUN cd /tmp/zips && \
    unzip aws-sam-cli-linux-x86_64.zip -d sam-installation && \
    ./sam-installation/install

RUN cd /tmp/zips && \
    unzip awscliv2.zip && \
    ./aws/install

RUN wget -O /usr/bin/b2 https://github.com/Backblaze/B2_Command_Line_Tool/releases/latest/download/b2-linux && \
    chmod +x /usr/bin/b2

USER coder