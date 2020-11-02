defmodule TodoApi.Validator do
  @create_todo_schema %{
    "type" => "object",
    "properties" => %{
      "text" => %{"type" => "string"}
    },
    "required" => ["text"]
  }

  def create_todo(body) do
    case ExJsonSchema.Validator.validate(@create_todo_schema, body) do
      :ok ->
        {:ok, create_todo_struct(body)}
      {:error, errors} ->
        {:error, errors}
    end
  end
  defp create_todo_struct(body) do
    %TodoApi.Schema.Todo{text: body["text"]}
  end
end
