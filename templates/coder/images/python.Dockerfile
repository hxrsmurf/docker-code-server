FROM python:3-slim

RUN apt-get update
RUN apt install sudo git unzip -y

COPY --from=builder /tmp/terraform /usr/bin/terraform
COPY --from=builder /tmp/zips /tmp/zips

RUN cd /tmp/zips && \
    unzip aws-sam-cli-linux-x86_64.zip -d sam-installation && \
    ./sam-installation/install

RUN cd /tmp/zips && \
    unzip awscliv2.zip && \
    ./aws/install

RUN useradd coder \
    --create-home \
    --shell=/bin/bash \
    --uid=2000 \
    --user-group && \
    echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

USER coder