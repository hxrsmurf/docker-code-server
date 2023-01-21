sudo docker build -f coder/images/builder.Dockerfile . --tag builder
sudo docker build -f coder/images/debian.Dockerfile .
sudo docker build -f coder/images/node.Dockerfile .
sudo docker build -f coder/images/python.Dockerfile .