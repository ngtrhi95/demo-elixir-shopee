defmodule Ecommerce.MixProject do
  use Mix.Project

  def project do
    [
      app: :ecommerce,
      version: "0.1.0",
      elixir: "~> 1.11.2",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Ecommerce, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix, "~> 1.3.0"},
      {:plug, "~> 1.4"},
      {:cowboy, "~> 1.1"},
      {:plug_cowboy, "~> 1.0"},
      {:jason, "~> 1.1"},
      {:httpoison, "~> 1.8"},
      {:decimal, "~> 1.0"},
      {:poison, "~> 3.1"}
    ]
  end
end
