# SPDX-FileCopyrightText: 2019 Frank Hunleth
#
# SPDX-License-Identifier: Apache-2.0
#
defmodule IPCalculatorTest do
  use ExUnit.Case

  alias OneDHCPD.IPCalculator

  test "mask is a slash 30 subnet" do
    assert IPCalculator.mask() == {255, 255, 255, 252}

    # This is more of a test of the in_subnet30 helper
    assert in_subnet30(IPCalculator.mask(), {255, 255, 255, 255})
  end

  test "our and their IP addresses are in same subnet" do
    subnet = IPCalculator.default_subnet("testifname", "testhostname")
    us = IPCalculator.our_ip_address(subnet)
    them = IPCalculator.their_ip_address(subnet)

    assert in_subnet30(us, them)
  end

  test "different ifname is in different subnet" do
    subnet1 = IPCalculator.default_subnet("eth0", "hostname")
    subnet2 = IPCalculator.default_subnet("eth1", "hostname")

    refute in_subnet30(subnet1, subnet2)
  end

  test "different hostname is in different subnet" do
    subnet1 = IPCalculator.default_subnet("eth0", "host1")
    subnet2 = IPCalculator.default_subnet("eth0", "host2")

    refute in_subnet30(subnet1, subnet2)
  end

  test "default_subnet returns /30 addresses" do
    {_, _, _, d} = IPCalculator.default_subnet("eth0", "host1")
    assert Bitwise.band(d, 0x3) == 0
  end

  test "default_subnet is deterministic" do
    assert {172, 31, 1, 28} == IPCalculator.default_subnet("usb0", "host1")
    assert {172, 31, 194, 196} == IPCalculator.default_subnet("usb0", "host2")
    assert {172, 31, 66, 112} == IPCalculator.default_subnet("usb1", "host1")
  end

  defp in_subnet30({a1, b1, c1, d1}, {a2, b2, c2, d2}) do
    <<first_net::30, _::2>> = <<a1, b1, c1, d1>>
    <<second_net::30, _::2>> = <<a2, b2, c2, d2>>

    first_net == second_net
  end
end
