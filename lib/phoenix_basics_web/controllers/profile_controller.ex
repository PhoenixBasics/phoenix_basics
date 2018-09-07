defmodule BasicsWeb.ProfileController do
  use BasicsWeb, :controller

  alias Basics.Membership

  def index(conn, _params) do
    profiles = Membership.list_profiles()
    render(conn, "index.html", profiles: profiles)
  end

  def show(conn, %{"id" => id}) do
    profile = Membership.get_profile!(id)
    render(conn, "show.html", profile: profile)
  end

  def edit(conn, _params) do
    render(conn, "edit.html",
      profile: conn |> current_user() |> Map.get(:profile),
      changeset: conn |> current_user() |> Membership.change_profile()
    )
  end

  def update(conn, %{"profile" => params}) do
    case conn |> current_user() |> Membership.update_profile(params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end

  def current_user(conn), do: conn.assigns.current_user
end
