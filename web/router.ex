defmodule Convo.Router do
  use Convo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Convo.Plugs.Auth
  end

  scope "/", Convo do
    pipe_through :browser

    resources "/", ConversionController, only: [:create, :new, :index]
    get "/success", ConversionController, :success
  end

  scope "/auth", Convo do
    pipe_through :browser

    get "/:provider", AuthController, :index
    get "/:provider/callback", AuthController, :callback
    delete "/", AuthController, :delete
  end
end
