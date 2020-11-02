defmodule TodoApi.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/ping" do
    send_json_resp(conn, 200, Jason.encode!(%{message: "pong"}))
  end

  post "/todo" do
    response = %TodoApi.Schema.Todo{text: conn.body_params["text"]}
      |> TodoApi.Repo.insert!()
      |> project()
      |> Jason.encode!()

    send_json_resp(conn, 201, response)
  end

  get "/todo" do
    todos = TodoApi.Repo.all(TodoApi.Schema.Todo)
    |> Enum.map(&project/1)
    send_json_resp(conn, 200, Jason.encode!(todos))
  end

  defp project(%TodoApi.Schema.Todo{id: id, text: text}) do
    %{id: id, text: text}
  end

  defp send_json_resp(conn, status, body) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(status, body)
  end

end
