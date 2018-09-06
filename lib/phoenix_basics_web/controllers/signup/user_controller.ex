defmodule BasicsWeb.Signup.UserController do
  use BasicsWeb, :controller

  alias Basics.Signup
  alias Basics.Signup.User

  def index(conn, _params) do
    users = Signup.list_users()
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = Signup.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Signup.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: signup_user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Signup.get_user!(id)
    render(conn, "show.html", user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = Signup.get_user!(id)
    changeset = Signup.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Signup.get_user!(id)

    case Signup.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: signup_user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Signup.get_user!(id)
    {:ok, _user} = Signup.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: signup_user_path(conn, :index))
  end
end
