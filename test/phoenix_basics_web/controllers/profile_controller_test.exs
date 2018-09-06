defmodule BasicsWeb.ProfileControllerTest do
  use BasicsWeb.ConnCase

  alias Basics.Membership

  @create_attrs %{
    company: "some company",
    description: "some description",
    first: "some first",
    github: "some github",
    image: "some image",
    last: "some last",
    slug: "some slug",
    title: "some title",
    twitter: "some twitter"
  }
  @update_attrs %{
    company: "some updated company",
    description: "some updated description",
    first: "some updated first",
    github: "some updated github",
    image: "some updated image",
    last: "some updated last",
    slug: "some updated slug",
    title: "some updated title",
    twitter: "some updated twitter"
  }
  @invalid_attrs %{
    company: nil,
    description: nil,
    first: nil,
    github: nil,
    image: nil,
    last: nil,
    slug: nil,
    title: nil,
    twitter: nil
  }

  def fixture(:profile) do
    {:ok, profile} = Membership.create_profile(@create_attrs)
    profile
  end

  describe "index" do
    test "lists all profiles", %{conn: conn} do
      conn = get(conn, profile_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Profiles"
    end
  end

  describe "new profile" do
    test "renders form", %{conn: conn} do
      conn = get(conn, profile_path(conn, :new))
      assert html_response(conn, 200) =~ "New Profile"
    end
  end

  describe "create profile" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, profile_path(conn, :create), profile: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == profile_path(conn, :show, id)

      conn = get(conn, profile_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Profile"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, profile_path(conn, :create), profile: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Profile"
    end
  end

  describe "edit profile" do
    setup [:create_profile]

    test "renders form for editing chosen profile", %{conn: conn, profile: profile} do
      conn = get(conn, profile_path(conn, :edit, profile))
      assert html_response(conn, 200) =~ "Edit Profile"
    end
  end

  describe "update profile" do
    setup [:create_profile]

    test "redirects when data is valid", %{conn: conn, profile: profile} do
      conn = put(conn, profile_path(conn, :update, profile), profile: @update_attrs)
      assert redirected_to(conn) == profile_path(conn, :show, profile)

      conn = get(conn, profile_path(conn, :show, profile))
      assert html_response(conn, 200) =~ "some updated company"
    end

    test "renders errors when data is invalid", %{conn: conn, profile: profile} do
      conn = put(conn, profile_path(conn, :update, profile), profile: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Profile"
    end
  end

  describe "delete profile" do
    setup [:create_profile]

    test "deletes chosen profile", %{conn: conn, profile: profile} do
      conn = delete(conn, profile_path(conn, :delete, profile))
      assert redirected_to(conn) == profile_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, profile_path(conn, :show, profile))
      end)
    end
  end

  defp create_profile(_) do
    profile = fixture(:profile)
    {:ok, profile: profile}
  end
end
