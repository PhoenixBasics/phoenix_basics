defmodule BasicsWeb.ProfileControllerTest do
  use BasicsWeb.ConnCase

  alias Basics.Membership
  alias Basics.Membership.Profile
  alias Basics.Membership.User
  alias Basics.Repo

  @update_attrs %{
    company: "Pattern Toaster",
    description: "I'm an Elixir Developer who loves BBQ",
    first: "Brian",
    github: "mcelaney",
    image: "n/a",
    last: "McElaney",
    slug: "mac2",
    title: "Director, Product Development",
    twitter: "mcelaney"
  }

  @invalid_attrs %{slug: nil}

  describe "given a user with a profile" do
    setup do
      user = %User{profile: %Profile{slug: "mac"}} |> Repo.insert!()

      [user: Membership.get_user(user.id)]
    end

    test "edit profile renders form for editing chosen profile", %{conn: conn} do
      conn = conn |> authed_conn() |> get(profile_path(conn, :edit))
      assert html_response(conn, 200) =~ "Edit Profile"
    end

    test "update profile redirects when data is valid", %{conn: conn} do
      conn = conn |> authed_conn() |> get(profile_path(conn, :edit))
      conn = put(conn, profile_path(conn, :update), profile: @update_attrs)
      assert redirected_to(conn) == page_path(conn, :index)

      conn = get(conn, profile_path(conn, :show, "mac2"))
      assert html_response(conn, 200) =~ "Pattern Toaster"
    end

    test "update profile renders errors when data is invalid", %{conn: conn} do
      conn = conn |> authed_conn() |> get(profile_path(conn, :edit))
      conn = put(conn, profile_path(conn, :update), profile: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Profile"
    end
  end

  # test "index lists all profiles", %{conn: conn} do
  #   conn = get(conn, profile_path(conn, :index))
  #   assert html_response(conn, 200) =~ "Listing Profiles"
  # end

  # describe "index" do
  #   test "lists all profiles", %{conn: conn} do
  #     conn = get(conn, profile_path(conn, :index))
  #     assert html_response(conn, 200) =~ "Listing Profiles"
  #   end
  # end
end
