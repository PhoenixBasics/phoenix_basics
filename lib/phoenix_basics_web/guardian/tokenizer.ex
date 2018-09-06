defmodule BasicsWeb.Guardian.Tokenizer do
  @moduledoc """
  Responsible for managing tokens for Guardian.

  See https://github.com/ueberauth/guardian for more details
  """

  use Guardian, otp_app: :phoenix_basics
  alias Basics.Membership

  def subject_for_token(%{id: id}, _) do
    {:ok, to_string(id)}
  end

  def resource_from_claims(claims) do
    case Membership.get_user(claims["sub"]) do
      nil -> {:error, :resource_not_found}
      user -> {:ok, user}
    end
  end
end
