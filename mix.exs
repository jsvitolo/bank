defmodule Stonex.MixProject do
  use Mix.Project

  def project do
    [
      app: :stonex,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Stonex.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.1.2"},
      {:jason, "~> 1.1"},
      {:ecto_sql, "~> 3.3"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
