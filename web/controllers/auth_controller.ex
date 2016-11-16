defmodule Convo.AuthController do
  use Convo.Web, :controller

  def index(conn, %{"provider" => provider}) do
    redirect conn, external: invoque(provider, :authorize_url!)
  end

  def callback(conn, %{"provider" => provider, "code" => code}) do
    client = invoque(provider, :get_token!, [[code: code]])

    conn
    |> put_session(:access_token, client.token.access_token)
    |> redirect(to: "/")
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:access_token)
    |> redirect(to: "/")
  end

  defp invoque(module, func, params \\ []) do
    "Elixir.Oauth.#{String.capitalize(module)}"
    |> String.to_existing_atom
    |> apply(func, params)
  end
end