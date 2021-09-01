FROM tiredofit/alpine:3.12
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

## Set Defaults
ENV CONTAINER_ENABLE_MESSAGING=FALSE \
    CONTAINER_NAME=postfix-relay

## Dependencies Setup
RUN apk update && \
    apk upgrade && \
    apk add -t .ppostfix-rundeps \
                cyrus-sasl-plain \
                libsasl \
                pflogsumm \
                postfix \
                mailx \
                py-pip \
                rsyslog \
                && \
   \
   pip install j2cli && \
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
