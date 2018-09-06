defmodule BasicsWeb.Guardian.Plug do
  @moduledoc """
  Pipeline which ensures a user is authenticated
  """

  use Guardian.Plug.Pipeline,
    otp_app: :phoenix_basics,
    error_handler: BasicsWeb.Guardian.ErrorHandler,
    module: BasicsWeb.Guardian.Tokenizer

  # If there is a session token, validate it
  plug(Guardian.Plug.VerifySession, claims: %{"typ" => "access"})

  # If there is an authorization header, validate it
  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})

  # Load the user if either of the verifications worked
  plug(Guardian.Plug.LoadResource, allow_blank: true)
end
