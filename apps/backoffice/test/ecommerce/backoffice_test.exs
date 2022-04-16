defmodule Ecommerce.BackofficeTest do
  use ExUnit.Case
  doctest Ecommerce.Backoffice

  test "greets the world" do
    assert Ecommerce.Backoffice.hello() == :world
  end
end
