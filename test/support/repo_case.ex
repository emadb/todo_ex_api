defmodule TodoApi.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias TodoApi.Repo

      import Ecto
      import Ecto.Query
      import TodoApi.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(TodoApi.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(TodoApi.Repo, {:shared, self()})
    end

    :ok
  end
end
