# github.com/tiredofit/docker-postfix-relay

[![GitHub release](https://img.shields.io/github/v/tag/tiredofit/docker-postfix-relay?style=flat-square)](https://github.com/tiredofit/docker-postfix-relay/releases/latest)
[![Build Status](https://img.shields.io/github/workflow/status/tiredofit/docker-postfix-relay/build?style=flat-square)](https://github.com/tiredofit/docker-postfix-relay/actions?query=workflow%3Abuild)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/postfix-relay.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/postfix-relay/)
[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/postfix-relay.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/postfix-relay/)
[![Become a sponsor](https://img.shields.io/badge/sponsor-tiredofit-181717.svg?logo=github&style=flat-square)](https://github.com/sponsors/tiredofit)
[![Paypal Donate](https://img.shields.io/badge/donate-paypal-00457c.svg?logo=paypal&style=flat-square)](https://www.paypal.me/tiredofit)

* * *

## About

Dockerfile to build a [Postfix](https://postfix.org) SMTP server used for relaying messages to an external SMTP server.

* Supports Authentication to remote server
* Persistent Data Spool and Storage
* Option for daily log file summaries

## Maintainer

- [Dave Conroy](https://github.com/tiredofit/)

## Prerequisites and Assumptions
- Remote SMTP Host
## Installation

### Build from Source
Clone this repository and build the image with `docker build <arguments> (imagename) .`

### Prebuilt Images
Builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/postfix-relay) and is the recommended method of installation.

The following image tags are available along with their tagged release based on what's written in the [Changelog](CHANGELOG.md):

| Container OS | Tag       |
| ------------ | --------- |
| Alpine       | `:latest` |

#### Multi Architecture
Images are built primarily for `amd64` architecture, and may also include builds for `arm/v6`, `arm/v7`, `arm64` and others. These variants are all unsupported. Consider [sponsoring](https://github.com/sponsors/tiredofit) my work so that I can work with various hardware. To see if this image supports multiple architecures, type `docker manifest (image):(tag)`

## Configuration

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working
[docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.

### Persistent Storage

The following directories are used for configuration and can be mapped for persistent storage.

| Directory | Description             |
| --------- | ----------------------- |
| `/data/`  | Postfix spool and queue |
| `/logs/`  | Logfiles                |


### Environment Variables

#### Base Images used

This image relies on an [Alpine Linux](https://hub.docker.com/r/tiredofit/alpine) base image that relies on an [init system](https://github.com/just-containers/s6-overlay) for added capabilities. Outgoing SMTP capabilities are handlded via `msmtp`. Individual container performance monitoring is performed by [zabbix-agent](https://zabbix.org). Additional tools include: `bash`,`curl`,`less`,`logrotate`, `nano`,`vim`.

Be sure to view the following repositories to understand all the customizable options:

| Image                                                  | Description                            |
| ------------------------------------------------------ | -------------------------------------- |
| [OS Base](https://github.com/tiredofit/docker-alpine/) | Customized Image based on Alpine Linux |


| Parameter           | Description                                                                                                    | Default         |
| ------------------- | -------------------------------------------------------------------------------------------------------------- | --------------- |
| `ACCEPTED_NETWORKS` | Who to allow access to relay                                                                                   | `172.16.0.0/12` |
| `DATA_LOCATION`     | Where the spool and other persistent files are stored                                                          | `/data/`        |
| `ENABLE_AUTH`       | Enable Authentication to remove SMTP host                                                                      | `TRUE`          |
| `LOG_FILE`          | Log File name                                                                                                  | `postfix.log`   |
| `LOG_PATH`          | Log Locations                                                                                                  | `/logs/`        |
| `LOG_TYPE`          | Output logs to `FILE` or `CONSOLE`                                                                             | `FILE`          |
| `LOG_SUMMARY`       | Create daily log summaries in `LOG_PATH/summary` of activity                                                   | `TRUE`          |
| `SMTP_HOST`         | The SMTP Host to forward mails to (e.g. mail.hostname.com)                                                     |                 |
| `SMTP_USER`         | The username for authentication to remote SMTP (e.g. username@hostname.com)                                    |                 |
| `SMTP_PASS`         | The password for above username (e.g. password)                                                                |                 |
| `SERVER_NAME`       | The hostname to identify ourselves to the remote SMTP Server (e.g. yourhost.hostname.com)                      | `example.com`   |
| `TLS_VERIFY`        | Trust Level for checking remote cert `none` `may` `encrypt` `dane` `dane-only` `fingerprint` `verify` `secure` | `may`           |
| `USE_TLS`           | Use TLS when sending `yes` or `no`                                                                             | `no`            |

### Networking

| Port | Description |
| ---- | ----------- |
| `25` | SMTP        |

* * *
## Maintenance

### Shell Access

For debugging and maintenance purposes you may want access the containers shell.

``bash
docker exec -it (whatever your container name is) bash
``
## Support

These images were built to serve a specific need in a production environment and gradually have had more functionality added based on requests from the community.
### Usage
- The [Discussions board](../../discussions) is a great place for working with the community on tips and tricks of using this image.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) personalized support.
### Bugfixes
- Please, submit a [Bug Report](issues/new) if something isn't working as expected. I'll do my best to issue a fix in short order.

### Feature Requests
- Feel free to submit a feature request, however there is no guarantee that it will be added, or at what timeline.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) regarding development of features.

### Updates
- Best effort to track upstream changes, More priority if I am actively using the image in a production environment.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) for up to date releases.

## License
MIT. See [LICENSE](LICENSE) for more details.

## References

* https://www.postfix.org
