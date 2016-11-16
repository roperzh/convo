defmodule Convo.AuthController.DeleteTest do
  use Convo.ConnCase, async: true

  @moduletag controllers: :auth

  setup %{conn: conn} do
    conn =
      conn
      |> login_user!
      |> delete(auth_path(conn, :delete))

    {:ok, %{conn: conn}}
  end

  test "DELETE /auth removes the current token from the session", %{conn: conn} do
    assert get_session(conn, :access_token) == nil
  end

  test "DELETE /auth redirects the user to the homepage", %{conn: conn} do
    assert redirected_to(conn) =~ "/"
  end
end
