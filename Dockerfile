FROM ubuntu

RUN apt-get update && apt-get install -y packer curl wget git 

RUN  curl -L -o /home/ubuntu-xenial64.box  https://vagrantcloud.com/ubuntu/boxes/xenial64/versions/20190406.0.0/providers/virtualbox.box
