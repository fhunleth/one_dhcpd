# Changelog

## v0.2.5

* Bug fixes
  * Fix missing `:crypto` dependency warning on Elixir 1.11

## v0.2.4

* Bug fixes
  * Fix C compiler warning

## v0.2.3

* Improvements
  * Added `OneDHCPD.prefix_length()` for a more convenient integration with
    `vintage_net`

* Bug fixes
  * Non-code affecting Dialyzer and compiler warning fixes
  * Fixed a currently unused DHCP option encoder (found when Dialyzing)

## v0.2.2

* Bug fixes
  * Switch from 172.16.0.0/12 to 172.31.0.0/16 for the default addresses. This
    avoids conflicts with Docker's use of 172.18.0.0/16.

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
