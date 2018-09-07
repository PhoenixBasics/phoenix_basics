defmodule Basics.Mixfile do
  use Mix.Project

  def project do
    [
      app: :phoenix_basics,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Basics.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.4"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},

      # For authentication
      {:bcrypt_elixir, "~> 1.0"},
      {:comeonin, "~>4.0"},
      {:guardian, "~> 1.0"},

      # View Formatting
      {:timex_ecto, "~> 3.3"},

      # For S3 integration and image uploads
      # File upload
      {:arc, "~> 0.10"},
      # Ecto Type
      {:arc_ecto, "~> 0.10"},
      # Aws
      {:ex_aws, "~> 2.0"},
      # S3
      {:ex_aws_s3, "~> 2.0"},
      # API HTTP client
      {:hackney, "~> 1.9"},
      # Fast JSON Parser
      {:poison, "~> 3.0"},
      # XML Parsing
      {:sweet_xml, "~> 0.6"},

      # Linting
      {:credo, "~> 0.10.0", only: [:dev, :test], runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"],
      lint: ["format", "credo --strict"]
    ]
  end
end
