FROM node:19
# Add a user `coder` so that you're not developing as the `root` user
RUN mkdir -p /etc/sudoers.d/
RUN mkdir /tmp/zips

RUN cd /tmp/zips && \
    wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip && \
    unzip aws-sam-cli-linux-x86_64.zip -d sam-installation && \
    ./sam-installation/install

RUN cd /tmp/zips && \
    curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip && \
    unzip awscliv2.zip && \
    ./aws/install

RUN cd /tmp && curl https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip -o terraform.zip && unzip terraform.zip && mv terraform /usr/bin/terraform

RUN wget -O /usr/bin/b2 https://github.com/Backblaze/B2_Command_Line_Tool/releases/latest/download/b2-linux && \
    chmod +x /usr/bin/b2

RUN useradd coder \
    --create-home \
    --shell=/bin/bash \
    --uid=2000 \
    --user-group && \
    echo "coder ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd

USER coder