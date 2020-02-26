import Config

config :stonex, Stonex.Repo,
  database: "stonex_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :stonex, ecto_repos: [Stonex.Repo]

config :stonex, StonexWeb.Endpoint,
  options: [port: 4000],
  scheme: :http,
  plug: StonexWeb.Endpoint
