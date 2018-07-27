FROM ubuntu

RUN apt-get update && apt-get install curl -y


RUN curl  https://storage.googleapis.com/kubernetes-release/release/v1.11.1/bin/linux/amd64/kubectl -o /root/1234
