defmodule Ecommerce.Store.FrontWeb.PageController do
  use Ecommerce.Store.FrontWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
