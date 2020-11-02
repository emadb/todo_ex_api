defmodule TodoApi.RouterTest do
  use ExUnit.Case
  use Plug.Test

  describe "Main router" do
    test "GET /ping should return pong" do
      conn =
        conn(:get, "/ping")
        |> put_req_header("content-type", "application/json")
        |> TodoApi.Router.call(TodoApi.Router.init([]))

      IO.inspect conn.resp_body
      res = Jason.decode!(conn.resp_body)

      assert res == %{"message" => "pong"}
    end
  end
end
