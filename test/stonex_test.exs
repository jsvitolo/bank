defmodule StonexTest do
  use ExUnit.Case
  doctest Stonex

  test "greets the world" do
    assert Stonex.hello() == :world
  end
end
