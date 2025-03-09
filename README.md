# one_dhcpd

[![Hex version](https://img.shields.io/hexpm/v/one_dhcpd.svg "Hex version")](https://hex.pm/packages/one_dhcpd)
[![API docs](https://img.shields.io/hexpm/v/one_dhcpd.svg?label=hexdocs "API docs")](https://hexdocs.pm/one_dhcpd/OneDHCPD.html)
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/fhunleth/one_dhcpd/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/fhunleth/one_dhcpd/tree/main)
[![REUSE status](https://api.reuse.software/badge/github.com/fhunleth/one_dhcpd)](https://api.reuse.software/info/github.com/fhunleth/one_dhcpd)

This is a simple DHCP server that's capable of giving out just one IP address.
The use case is to support connecting Nerves devices directly to laptops. Yes,
there are many ways of solving this problem. It took a long time to give up on
the available alternatives and write this, and we may end up abandoning this
project. Until then, there's `one_dhcpd`.

If you're looking for a DHCP server, check out
[dhcp_server](https://hex.pm/packages/dhcp_server). Note that since this project
was developed independent of that one, we were able to change the license to
Apache-2.0 to be in line with other Nerves projects.

## Usage

Before using this directly, check whether you can use it via
[`vintage_net_direct`](https://hex.pm/packages/vintage_net_direct).

If you'd like to manually use this, see the [Hex
docs](https://hexdocs.pm/one_dhcpd) for details.

