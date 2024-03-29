FROM docker.io/tiredofit/alpine:3.16
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

## Set Defaults
ENV CONTAINER_ENABLE_MESSAGING=FALSE \
    IMAGE_NAME="tiredofit/postfix-relay" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-postfix-relay/"

## Dependencies Setup
RUN apk update && \
    apk upgrade && \
    apk add -t .postfix-rundeps \
                cyrus-sasl \
                libsasl \
                logtail \
                pflogsumm \
                postfix \
                rsyslog \
                && \
   \
## Postfix Configuration
   mkfifo /var/spool/postfix/public/pickup && \
   ln -s /etc/postfix/aliases /etc/aliases && \
   \
## Cleanup
   rm -rf /var/cache/apk/*

## Networking Configuration
EXPOSE 25

## Entrypoint Configuration
ADD install /
