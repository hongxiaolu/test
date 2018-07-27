FROM ubuntu

RUN apt-get update && apt-get install curl -y


ADD https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl  /root/1234
