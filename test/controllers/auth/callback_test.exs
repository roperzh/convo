defmodule Convo.AuthController.CallbackTest do
  use Convo.ConnCase, async: true

  @moduletag controllers: :auth

  test "GET /auth/testprovider/callback", %{conn: conn} do
    conn = login_user!(conn)

    assert get_session(conn, :access_token)
    assert redirected_to(conn) =~ "/"
  end

  test "raises an error if with an invalid provider", %{conn: conn} do
    assert_raise ArgumentError, "argument error", fn ->
      get conn, auth_path(conn, :callback, "invalid-provider"), %{
        "code" => "some-token"
      }
    end
  end
end