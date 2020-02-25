import Config

config :stonex, StonexWeb.Endpoint,
  options: [port: 4000],
  scheme: :http,
  plug: StonexWeb.Endpoint
