import Config

config :stonex, Stonex.Repo,
  username: "postgres",
  password: "postgres",
  database: "stonex_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
