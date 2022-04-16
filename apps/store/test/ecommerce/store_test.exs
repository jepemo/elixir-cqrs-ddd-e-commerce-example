defmodule Ecommerce.StoreTest do
  use ExUnit.Case
  doctest Ecommerce.Store

  test "greets the world" do
    assert Ecommerce.Store.hello() == :world
  end
end
