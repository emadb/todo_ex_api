import Config

config :todo_api,
  ecto_repos: [TodoApi.Repo]

config :todo_api, TodoApi.Repo,
  database: "todo_db_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

import_config "#{Mix.env()}.exs"
