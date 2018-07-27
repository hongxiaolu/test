FROM ubuntu

RUN apt-get update && apt-get install curl -y


RUN curl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl -o /root/1234
