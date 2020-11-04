defmodule TodoApi.Schema.Todo do
  use Ecto.Schema

  schema "todos" do
    field(:text, :string)
    field(:is_complete, :boolean)
    timestamps()
  end
end
