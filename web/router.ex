defmodule Swolen.Router do
  use Swolen.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Swolen.UserNameAssigner
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Swolen do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Swolen do
  #   pipe_through :api
  # end
end
