defmodule Ecommerce.SharedTest do
  use ExUnit.Case
  doctest Ecommerce.Shared

  test "greets the world" do
    assert Ecommerce.Shared.hello() == :world
  end
end
