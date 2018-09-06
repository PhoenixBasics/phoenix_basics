defmodule BasicsWeb.Router do
  use BasicsWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", BasicsWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  scope "/signup", BasicsWeb.Signup, as: :signup do
    pipe_through(:browser)

    resources("/", UserController)
  end

  # Other scopes may use custom stacks.
  # scope "/api", BasicsWeb do
  #   pipe_through :api
  # end
end
