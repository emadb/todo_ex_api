import Config

config :todo_api, TodoApi.Repo,
  database: "todo_db_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
