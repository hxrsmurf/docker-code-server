FROM debian:stable-slim as builder

RUN apt-get update
RUN apt-get install curl wget unzip -yf

RUN mkdir /tmp/zips

RUN cd /tmp/zips && \
    wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip

RUN cd /tmp/zips && \
    curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip

RUN cd /tmp && curl https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip -o terraform.zip && unzip terraform.zip && mv terraform /usr/bin/terraform

# Using non-slim reduces build time, but increases image size by .44 GiB
FROM node:19

COPY --from=builder /usr/bin/terraform /usr/bin/terraform
COPY --from=builder /tmp/zips /tmp/zips

RUN cd /tmp/zips && \
    unzip aws-sam-cli-linux-x86_64.zip -d sam-installation && \
    ./sam-installation/install

RUN cd /tmp/zips && \
    unzip awscliv2.zip && \
    ./aws/install

RUN apt-get update
RUN apt-get install unzip curl vim git python3 python3-pip -yf

RUN curl -fsSL https://code-server.dev/install.sh | sh
COPY /config/config.yaml /root/.config/code-server/config.yaml
RUN git config --global user.email "first.last@example.com" && git config --global user.name "first last" && git config --global core.editor vim
RUN code-server --install-extension GitHub.vscode-pull-request-github
RUN code-server --install-extension vscodevim.vim
RUN code-server --install-extension dsznajder.es7-react-js-snippets
RUN code-server --install-extension hashicorp.terraform
RUN code-server --install-extension ms-python.python
RUN code-server --install-extension bradlc.vscode-tailwindcss
RUN code-server --install-extension esbenp.prettier-vscode
RUN code-server --uninstall-extension ms-toolsai.jupyter
RUN code-server --uninstall-extension ms-python.isort
ENTRYPOINT ["code-server"]