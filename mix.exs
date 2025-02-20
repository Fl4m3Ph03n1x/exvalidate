defmodule Exvalidate.MixProject do
  use Mix.Project

  def project do
    [
      app: :exvalidate,
      version: "0.0.1",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      elixirc_options: [warnings_as_errors: true],
      description: description(),
      package: package(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],

      # Docs
      source_url: "https://github.com/cnavas88/exvalidate",
      homepage_url: "https://github.com/cnavas88/exvalidate"
    ]
  end

  defp description do
    "exvalidate is a data validator for elixir, container a plug for the
    validate request."
  end

  defp package do
    [
      maintainers: ["Carlos Navas"],
      licenses: [],
      links: %{
        "Github" => "https://github.com/cnavas88/exvalidate"
      }
    ]
  end

  defp aliases do
    [
      quality: ["format", "credo --strict", "dialyzer"],
      "quality.ci": [
        "format --check-formatted",
        "credo --strict",
        "dialyzer --halt-exit-status"
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger, :plug]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.0.5", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.11", only: :test},
      {:jason, "~> 1.1.2"},
      {:plug, "~> 1.8.0", optional: true}
    ]
  end
end
