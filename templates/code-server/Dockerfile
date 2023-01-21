FROM "codercom/code-server:latest"

USER root

COPY --from=builder /tmp/terraform /usr/bin/terraform
COPY --from=builder /tmp/zips /tmp/zips
COPY --from=builder /tmp/b2 /usr/bin/b2

RUN apt-get update
RUN apt-get install docker-compose -yf
RUN apt-get install git unzip -yf

RUN cd /tmp/zips && \
    unzip aws-sam-cli-linux-x86_64.zip -d sam-installation && \
    ./sam-installation/install

RUN cd /tmp/zips && \
    unzip awscliv2.zip && \
    ./aws/install

RUN curl -fsSL https://coder.com/install.sh | sh

USER coder