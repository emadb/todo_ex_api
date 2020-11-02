defmodule TodoApiTest do
  use ExUnit.Case
  doctest TodoApi

  test "greets the world" do
    assert TodoApi.hello() == :world
  end
end
