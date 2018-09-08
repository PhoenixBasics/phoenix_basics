defmodule BasicsWeb.Router do
  use BasicsWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :guardian do
    plug(BasicsWeb.Guardian.Plug)
    plug(BasicsWeb.Guardian.CurrentUserPlug)
  end

  pipeline :ensure_auth do
    plug(Guardian.Plug.EnsureAuthenticated)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", BasicsWeb do
    pipe_through([:browser, :guardian, :ensure_auth])

    resources("/profile", ProfileController, only: [:edit, :update], singleton: true)
    resources("/members", ProfileController, only: [:index, :show])
  end

  scope "/", BasicsWeb do
    # Use the default browser stack
    pipe_through([:browser, :guardian])

    get("/", PageController, :index)
    resources("/schedule", ScheduleController, only: [:index, :show])
  end

  scope "/signup", BasicsWeb.Signup, as: :signup do
    pipe_through([:browser, :guardian])

    resources("/", UserController, only: [:new, :create])
  end

  scope "/", BasicsWeb.Auth, as: :auth do
    pipe_through([:browser, :guardian, :ensure_auth])
    post("/logout", UserController, :delete)
  end

  scope "/auth", BasicsWeb.Auth, as: :auth do
    pipe_through([:browser, :guardian])

    resources("/", UserController, only: [:new, :create])
  end

  # Other scopes may use custom stacks.
  # scope "/api", BasicsWeb do
  #   pipe_through :api
  # end
end
