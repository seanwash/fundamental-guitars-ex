defmodule FgWeb.Router do
  use FgWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FgWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/exercises", ExerciseController
    resources "/tags", TagController
  end

  # Other scopes may use custom stacks.
  # scope "/api", FgWeb do
  #   pipe_through :api
  # end
end
