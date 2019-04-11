FROM alpine

RUN apk add --no-cahce curl 

RUN  curl -L -o /home/bionic-server-cloudimg-amd64.ova  http://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.ova
