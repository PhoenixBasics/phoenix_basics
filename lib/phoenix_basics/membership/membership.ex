defmodule Basics.Membership do
  @moduledoc """
  Context responsible for managing profile information
  """

  import Ecto.Query
  alias Basics.Membership.User
  alias Basics.Repo

  def get_user(id) do
    User
    |> where([user], user.id == ^id)
    |> Repo.one()
  end
end
