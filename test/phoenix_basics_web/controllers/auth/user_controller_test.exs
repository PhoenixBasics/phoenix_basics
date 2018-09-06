defmodule BasicsWeb.Auth.UserControllerTest do
  use BasicsWeb.ConnCase
  alias Basics.Membership.User
  alias Basics.Signup

  @create_attrs %{password: "some password", username: "some username"}
  @invalid_attrs %{password: "some other", username: "some other"}

  describe "Login Form" do
    test "renders form", %{conn: conn} do
      conn = get(conn, auth_user_path(conn, :new))
      assert html_response(conn, 200) =~ "Log In"
    end
  end

  describe "Given a user exists in the database" do
    setup do
      {:ok, user} = Signup.create_user(@create_attrs)
      [user: user]
    end

    test "redirects to homepage when data is valid", %{conn: conn, user: user} do
      conn = post(conn, auth_user_path(conn, :create), user: @create_attrs)

      assert redirected_to(conn) == page_path(conn, :index)

      conn = get(conn, page_path(conn, :index))

      %User{id: id} = conn.assigns.current_user
      assert id == user.id
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, auth_user_path(conn, :create), user: @invalid_attrs)
      assert html_response(conn, 200) =~ "Log In"

      conn = get(conn, page_path(conn, :index))
      assert is_nil(conn.assigns.current_user)
    end

    test "logout", %{conn: conn} do
      conn = post(conn, auth_user_path(conn, :create), user: @create_attrs)
      conn = post(conn, auth_user_path(conn, :delete))

      assert redirected_to(conn) == page_path(conn, :index)

      conn = get(conn, page_path(conn, :index))
      assert is_nil(conn.assigns.current_user)
    end
  end
end
