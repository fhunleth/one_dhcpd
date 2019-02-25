# Changelog

## v0.2.1

* Bug fixes
  * Move build products under `_build` so that it's not required to build clean
    between switching targets.

## v0.2.0

* Bug fixes
  * Send DHCP NAKs when clients request the wrong IP address. Speeds up getting
    the right address when switching networks.

## v0.1.0

Initial release
