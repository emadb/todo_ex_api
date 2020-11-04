defmodule TodoApi.RepoCase do
  use ExUnit.CaseTemplate
  alias Ecto.Adapters.SQL.Sandbox

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
    :ok = Sandbox.checkout(TodoApi.Repo)

    unless tags[:async] do
      Sandbox.mode(TodoApi.Repo, {:shared, self()})
    end

    :ok
  end
end
