defmodule TodoApi.RouterTest do
  use ExUnit.Case
  use Plug.Test
  use TodoApi.RepoCase

  describe "Main router" do
    test "GET /ping should return pong" do
      conn =
        conn(:get, "/ping")
        |> put_req_header("content-type", "application/json")
        |> TodoApi.Router.call(TodoApi.Router.init([]))

      res = Jason.decode!(conn.resp_body)

      assert res == %{"message" => "pong"}
    end
  end

  test "POST /todo should save to database" do

    todo = %{text: "prova numero 1"}

    conn =
      conn(:post, "/todo", todo)
      |> put_req_header("content-type", "application/json")
      |> TodoApi.Router.call(TodoApi.Router.init([]))

    assert conn.status == 201
    res = Jason.decode!(conn.resp_body)

    assert %{"text" => "prova numero 1", "id" => id} = res
    assert id > 0
  end

  # test "POST /todo should save to database" do

  #   todo = %{text: "prova numero 2"}

  #   conn =
  #     conn(:post, "/todo", todo)
  #     |> put_req_header("content-type", "application/json")
  #     |> TodoApi.Router.call(TodoApi.Router.init([]))


  # end
end
