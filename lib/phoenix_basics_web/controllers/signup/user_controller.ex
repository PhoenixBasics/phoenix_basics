defmodule BasicsWeb.Signup.UserController do
  use BasicsWeb, :controller

  alias Basics.Signup
  alias Basics.Signup.User
  alias BasicsWeb.Guardian.Tokenizer.Plug, as: GuardianPlug

  def new(conn, _params) do
    changeset = Signup.change_user(%User{})

    conn
    |> GuardianPlug.sign_out()
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Signup.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> GuardianPlug.sign_in(user)
        |> redirect(to: page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
