FROM ubuntu

RUN apt update && apt-get install apache2-utils -y

RUN  ab -c 400 -n 10000000 https://bccto.me/
