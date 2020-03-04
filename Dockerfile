FROM alpine

RUN apk add --no-cache curl;cd /home ; curl -L -O https://downloads-ire-f5.s3.amazonaws.com/big-ip%2Fbig-ip_v13.x%2F13.1.1%2Fenglish%2F13.1.1.4_virtual-edition%2FBIGIP-13.1.1.4-0.0.4.ALL-scsi.ova