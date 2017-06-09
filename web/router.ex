defmodule AwesomeRanking.Router do
  use AwesomeRanking.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    resources "/users", AwesomeRanking.UserController, except: [:new, :edit]
    resources "/scores", AwesomeRanking.ScoreController, except: [:new, :edit]
  end

  scope "/", AwesomeRanking do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end


  # Other scopes may use custom stacks.
  # scope "/api", AwesomeRanking do
  #   pipe_through :api
  # end
end
