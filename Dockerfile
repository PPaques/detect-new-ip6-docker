FROM alpine:3.6

LABEL version="1.0"
LABEL author="Pierre Paques"
LABEL maintainer="pierre.paques01@gmail.com"
LABEL description="Docker Container which use thc-ipv6 to detect new inserted device on a network."

RUN apk update && apk add ca-certificates && update-ca-certificates && apk add openssl build-base libpcap-dev

COPY thc-ipv6 .

COPY entrypoint.sh entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN make all

run apk del build-base

WORKDIR /

ENTRYPOINT ["/entrypoint.sh"]