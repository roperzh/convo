defmodule Convo.Router do
  use Convo.Web, :router

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

  scope "/", Convo do
    pipe_through :browser

    resources "/conversions", ConversionController, only: [:create, :new, :show]
  end

  scope "/auth", Convo do
    pipe_through :browser

    get "/:provider", AuthController, :index
    get "/:provider/callback", AuthController, :callback
  end
end
