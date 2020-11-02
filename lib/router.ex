defmodule TodoApi.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/ping" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{message: "pong"}))
  end

end
