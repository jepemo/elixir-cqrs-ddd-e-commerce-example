defmodule Ecommerce.Backoffice.FrontWeb.PageController do
  use Ecommerce.Backoffice.FrontWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
