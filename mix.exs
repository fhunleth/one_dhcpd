defmodule OneDHCPD.MixProject do
  use Mix.Project

  def project do
    [
      app: :one_dhcpd,
      version: "0.2.0",
      elixir: "~> 1.6",
      description: description(),
      package: package(),
      compilers: [:elixir_make | Mix.compilers()],
      make_clean: ["clean"],
      docs: [extras: ["README.md"]],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {OneDHCPD.Application, []}
    ]
  end

  defp description do
    "One address DHCP server"
  end

  defp package do
    %{
      files: [
        "lib",
        "src/*.[ch]",
        "mix.exs",
        "README.md",
        "LICENSE",
        "Makefile"
      ],
      maintainers: ["Frank Hunleth"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/fhunleth/one_dhcpd"}
    }
  end

  defp deps do
    [
      {:elixir_make, "~> 0.4", runtime: false},
      {:ex_doc, "~> 0.19", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.3", only: [:dev, :test], runtime: false}
    ]
  end
end
