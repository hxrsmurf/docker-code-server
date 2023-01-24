sudo docker build -f coder/images/builder.Dockerfile . --tag builder
sudo docker build -f coder/images/debian.Dockerfile . --tag coder-debian:v0.1
sudo docker build -f coder/images/node.Dockerfile . --tag coder-node:v0.1
sudo docker build -f coder/images/python.Dockerfile . --tag coder-python:v0.1