defmodule TodoApi.Router do
  use Plug.Router

  import Ecto.Query

  plug(:match)
  plug(:dispatch)

  get "/ping" do
    send_json_resp(conn, 200, %{message: "pong"})
  end

  post "/todo" do
    case TodoApi.Validator.create_todo(conn.body_params) do
      {:ok, todo} ->
        response =
          todo
          |> TodoApi.Repo.insert!()
          |> project()

        send_json_resp(conn, 201, response)

      {:error, _} ->
        send_json_resp(conn, 400, %{message: "bad format"})
    end
  end

  get "/todo" do
    todos =
      TodoApi.Repo.all(TodoApi.Schema.Todo)
      |> Enum.map(&project/1)

    send_json_resp(conn, 200, todos)
  end

  patch "/todo/:id" do
    {id, _} = Integer.parse(id)

    TodoApi.Schema.Todo
    |> where([t], t.id == ^id)
    |> update(set: [is_complete: true])
    |> TodoApi.Repo.update_all([])

    send_json_resp(conn, 200, %{})
  end

  defp project(%TodoApi.Schema.Todo{id: id, text: text}) do
    %{id: id, text: text}
  end

  defp send_json_resp(conn, status, body) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(status, Jason.encode!(body))
  end
end
