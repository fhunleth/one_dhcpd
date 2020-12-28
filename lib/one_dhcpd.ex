defmodule OneDHCPD do
  alias OneDHCPD.{DHCPDSupervisor, Server, IPCalculator}

  @moduledoc """
  The One Address DHCP Server!

  This is a simple DHCP server for supplying IP addresses on point-to-point
  Ethernet links.  To use it, specify a static IPv4 address on the Ethernet
  interface and then start the server up.  OneDHCPD can supply an IPv4 address
  for you by calling `OneDHCPD.default_ip_address/1` that should minimize IP
  conflicts with the user's network and other OneDHCPD servers. This is the
  recommended approach.

  OneDHCPD is mostly used behinds the scenes with VintageNet. Here's an example
  for using it with a virtual USB ethernet interface:

  ```elixir
  iex> VintageNet.configure("usb0", %{type: VintageNetDirect})
  :ok
  ```

  The Nerves new project generator adds this configuration by default. If you'd
  like more information, see the
  [VintageNetDirect[(https://hexdocs.pm/vintage_net_direct/VintageNetDirect.html)
  documentation.

  """

  @doc """
  Start a DHCP server running on the specified interface. If one is already
  running, `{:error, {:already_started, pid}}` is returned.

  The server takes the following options:

  * `:port` - the UDP port number to use (specify if debugging)
  * `:subnet` - a /30 IP subnet to use
  """
  @spec start_server(String.t(), keyword()) :: DynamicSupervisor.on_start_child()
  def start_server(ifname, options \\ []) do
    DynamicSupervisor.start_child(DHCPDSupervisor, {Server, [ifname, options]})
  end

  @doc """
  Stop a DHCP server.
  """
  @spec stop_server(String.t()) :: :ok | {:error, :not_found}
  def stop_server(ifname) do
    case Process.whereis(Server.server_name(ifname)) do
      nil -> {:error, :not_found}
      pid -> DynamicSupervisor.terminate_child(OneDHCPD.DHCPDSupervisor, pid)
    end
  end

  @doc """
  Return the default server IP address that would be used for the specified
  interface.
  """
  @spec default_ip_address(String.t()) :: :inet.ip4_address()
  def default_ip_address(ifname) do
    IPCalculator.default_subnet(ifname)
    |> IPCalculator.our_ip_address()
  end

  @doc """
  Return the subnet mask that goes along with default_ip_address/1.
  """
  @spec default_subnet_mask() :: :inet.ip4_address()
  def default_subnet_mask() do
    IPCalculator.mask()
  end
end
