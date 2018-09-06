defmodule BasicsWeb.Auth.UserController do
  use BasicsWeb, :controller

  alias Basics.Auth
  alias Basics.Auth.User
  alias BasicsWeb.Guardian.Tokenizer.Plug, as: GuardianPlug

  def new(conn, _params) do
    changeset = Auth.change_user(%User{})

    conn
    |> GuardianPlug.sign_out()
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Auth.authenticate_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User Logged In Successfully.")
        |> GuardianPlug.sign_in(user)
        |> redirect(to: page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Username/Password combination did not exist.")
        |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn, _) do
    conn
    |> GuardianPlug.sign_out()
    |> redirect(to: page_path(conn, :index))
  end
end
