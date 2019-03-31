FROM ubuntu

RUN apt-get update && apt-get install -y packer curl wget git 

RUN git clone https://github.com/xiaoluhong/bento.git \
    && cd bento/ubuntu \
    && packer build -only=virtualbox-iso ubuntu-16.04-amd64.json
