defmodule BasicsWeb.Auth.UserController do
  use BasicsWeb, :controller

  alias Basics.Auth
  alias Basics.Auth.User

  def new(conn, _params) do
    changeset = Auth.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Auth.authenticate_user(user_params) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "User Logged In Successfully.")
        |> redirect(to: page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Username/Password combination did not exist.")
        |> render("new.html", changeset: changeset)
    end
  end
end
