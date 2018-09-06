defmodule BasicsWeb.PageController do
  use BasicsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
