defmodule BasicsWeb.Signup.UserControllerTest do
  use BasicsWeb.ConnCase

  alias Basics.Signup

  @create_attrs %{password: "some password", username: "some username"}
  @invalid_attrs %{password: nil, username: nil}

  def fixture(:user) do
    {:ok, user} = Signup.create_user(@create_attrs)
    user
  end

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get(conn, signup_user_path(conn, :new))
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "create user" do
    test "redirects to homepage when data is valid", %{conn: conn} do
      conn = post(conn, signup_user_path(conn, :create), user: @create_attrs)

      assert redirected_to(conn) == page_path(conn, :index)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, signup_user_path(conn, :create), user: @invalid_attrs)
      assert html_response(conn, 200) =~ "New User"
    end
  end
end
