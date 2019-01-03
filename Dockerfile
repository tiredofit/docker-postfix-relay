FROM tiredofit/alpine:3.8
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

## Set Defaults
ENV ENABLE_SMTP=FALSE \
    ZABBIX_HOSTNAME=postfix-relay

## Dependencies Setup
RUN   apk update && \
      apk add \
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
