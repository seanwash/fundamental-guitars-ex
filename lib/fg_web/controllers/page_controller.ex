defmodule FgWeb.PageController do
  use FgWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
