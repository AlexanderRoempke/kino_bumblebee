defmodule KinoBumblebee.MixProject do
  use Mix.Project

  @version "0.5.0"
  @description "Bumblebee integration with Livebook"

  def project do
    [
      app: :kino_bumblebee,
      version: @version,
      description: @description,
      name: "KinoBumblebee",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [
      mod: {KinoBumblebee.Application, []}
    ]
  end

  defp deps do
    [
      {:bumblebee, git: "https://github.com/elixir-nx/bumblebee"},
      # {:kino, "~> 0.13"},
      {:kino, github: "livebook-dev/kino", override: true},
      {:nx, "~> 0.7"},
      {:exla, "~> 0.7", only: [:dev, :test]},
      {:ex_doc, "~> 0.29", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "components",
      source_url: "https://github.com/livebook-dev/kino_bumblebee",
      source_ref: "v#{@version}",
      extras: ["guides/components.livemd"],
      groups_for_modules: [
        Kinos: [
          Kino.Bumblebee.HighlightedText,
          Kino.Bumblebee.ScoredList
        ]
      ]
    ]
  end

  def package do
    [
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => "https://github.com/livebook-dev/kino_bumblebee"
      }
    ]
  end
end
