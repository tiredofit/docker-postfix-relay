# hub.docker.com/r/tiredofit/postfix-relay

[![Build Status](https://img.shields.io/docker/cloud/build/tiredofit/postfix-relay.svg)](https://hub.docker.com/r/tiredofit/postfix-relay)
[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/postfix-relay.svg)](https://hub.docker.com/r/tiredofit/postfix-relay)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/postfix-relay.svg)](https://hub.docker.com/r/tiredofit/postfix-relay)
[![Docker Layers](https://images.microbadger.com/badges/image/tiredofit/postfix-relay.svg)](https://microbadger.com/images/tiredofit/postfix-relay)


# Introduction

Dockerfile to build a simple Postfix container designed to relay messages to an external SMTP Server

This container uses Alpine:3.12 as a base.

[Changelog](CHANGELOG.md)

# Authors

- [Dave Conroy](https://github.com/tiredofit)

# Table of Contents

- [Introduction](#introduction)
    - [Changelog](CHANGELOG.md)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
    - [Data Volumes](#data-volumes)
    - [Environment Variables](#environmentvariables)   
- [Maintenance](#maintenance)
    - [Shell Access](#shell-access)
   - [References](#references)

# Prerequisites

This image will need to connect to an external SMTP Server with user authentication enabled.


# Installation

Automated builds of the image are available on [Registry](https://hub.docker.com/r/tiredofit/postfix-relay) and is the recommended method of installation.


```bash
docker pull tiredofit/postfix-relay
```

# Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.

# Configuration

### Data-Volumes

The following directories are used for configure and can be mapped for persistent storage.

| Directory | Description |
|-----------|-------------|
| `/var/log` | Postfix Mail Logs |


### Environment Variables

Below is the complete list of available options that can be used to customize your installation.

| Parameter | Description |
|-----------|-------------|
| `SMTP_HOST` | The SMTP Host to forward mails to (e.g. mail.hostname.com) - Default `localhost` |
| `SMTP_USER` | The username for authentication to remote SMTP (e.g. username@hostname.com) - REQUIRED |
| `SMTP_PASS` | The password for above username (e.g. password) -  REQUIRED |
| `SERVER_NAME` | The hostname to identify ourselves to the remote SMTP Server (e.g. yourhost.hostname.com) - Default `postfix-relay` |
| `ACCEPTED_NETWORKS` | Who to allow access to relay - Default `172.16.0.0/12` |
| `USE_TLS` | Use TLS when sending `yes` or `no` - Default `no` |
| `TLS_VERIFY` | Trust Level for checking remote cert (`none`, `may`, `encrypt`, `dane`, `dane-only`, `fingerprint`, `verify`, `secure` - Default `may`) |


# Maintenance
#### Shell Access

For debugging and maintenance purposes you may want access the containers shell. 

```bash
docker exec -it (whatever your container name is e.g. postfix-relay) bash
```

# References

* https://www.postfix.org