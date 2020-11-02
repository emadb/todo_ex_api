import Config

config :todo_api, TodoApi.Repo,
  database: "todo_db_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
