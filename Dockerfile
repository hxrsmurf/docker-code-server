FROM node:19-slim
RUN apt-get update && apt-get upgrade -yf
RUN apt-get install curl git -yf
RUN curl -fsSL https://code-server.dev/install.sh | sh
COPY /config/config.yaml /root/.config/code-server/config.yaml
ENTRYPOINT ["code-server"]