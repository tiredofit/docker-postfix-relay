## 4.0.2 2022-02-09 <dave at tiredofit dot ca>

   ### Changed
      - Refresh base image


## 4.0.1 2021-12-27 <dave at tiredofit dot ca>

   ### Changed
      - Cleanup extra output when Zabbix monitoring


## 4.0.0 2021-12-10 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.15 base
      - Rewrote Zabbix Monitoring Scripts and Templates
      - Reworked how configuration was auto generated
      - Added optional daily statistics for logs
      - Added ability to use authentication or not to remote SMTP host
      - Data persistence support for queues to support container restarts


## 3.4.1 2021-09-01 <dave at tiredofit dot ca>

   ### Added
      - Add cyrus-sasl-plain package


## 3.4.0 2021-08-31 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.12


## 3.3.0 2020-06-09 <dave at tiredofit dot ca>

   ### Added
      - Update to support tiredofit/alpine 5.0.0 Base Image


## 3.2.1 2019-01-03 <dave at tiredofit dot ca>

* Minor Base Image Shift

## 3.2 2019-01-03 <dave at tiredofit dot ca>

* Public release to github

## 3.1 2018-07-25 <dave at tiredofit dot ca>

* Update Aliases on startup to avoid root deferred queue rising

## 3.0 2018-07-15 <dave at tiredofit dot ca>

* Alpine 3.8
* S6 Overlay
* Refresh Postfix

## 2.0 2017-05-30 <dave at tiredofit dot ca>

* Rewrite
* Alpine 3.6
* Postfix, Rsyslog, Zabbix Checks
* Accepted Networks parsing

## 1.0 2016-11-25 <dave at tiredofit dot ca>

* Initial Release
* Requires Authentication and only connects via TLS
