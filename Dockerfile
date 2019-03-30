FROM alpine

RUN apk add --no-cache curl 
RUN curl -L -o /home/centos.box https://vagrantcloud.com/centos/boxes/7/versions/1902.01/providers/virtualbox.box
