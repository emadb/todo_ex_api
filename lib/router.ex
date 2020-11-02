defmodule TodoApi.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/ping" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{message: "pong"}))
  end

  post "/todo" do

    t = %TodoApi.Schema.Todo{text: conn.body_params["text"]}

    {:ok, todo } = TodoApi.Repo.insert(t)



    conn
    |> put_resp_content_type("application/json")
    |> send_resp(201, Jason.encode!(project(todo)))
  end

  defp project(%TodoApi.Schema.Todo{id: id, text: text}) do
    %{id: id, text: text}
  end

end
