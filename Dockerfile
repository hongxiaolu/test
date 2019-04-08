FROM alpine

RUN apk add --no-cahce curl 

RUN  curl -L -o /home/ubuntu-xenial64.box  https://vagrantcloud.com/ubuntu/boxes/xenial64/versions/20190406.0.0/providers/virtualbox.box
