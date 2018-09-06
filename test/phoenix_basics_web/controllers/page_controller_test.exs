defmodule BasicsWeb.PageControllerTest do
  use BasicsWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "4 - 7 September 2018"
  end
end
