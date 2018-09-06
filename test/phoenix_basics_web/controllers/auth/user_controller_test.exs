defmodule BasicsWeb.Auth.UserControllerTest do
  use BasicsWeb.ConnCase

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get(conn, auth_user_path(conn, :new))
      assert html_response(conn, 200) =~ "Log In"
    end
  end
end
