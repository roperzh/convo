defmodule Convo.AuthController.IndexTest do
  use Convo.ConnCase, async: true

  @moduletag controllers: :auth

  test "redirects to the mixcloud provider", %{conn: conn} do
    conn = get conn, auth_path(conn, :index, "mixcloud")

    assert redirected_to(conn) =~ "mixcloud.com/oauth/authorize"
  end

  test "redirects to home page if the provider is invalid", %{conn: conn} do
    assert_raise ArgumentError, "argument error", fn ->
      get conn, auth_path(conn, :index, "invalid-provider")
    end
  end
end
