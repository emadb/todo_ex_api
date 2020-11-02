defmodule TodoApi.Schema.Todo do
  use Ecto.Schema

  schema "todos" do
    field :text, :string
    timestamps()
  end
end
