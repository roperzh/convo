defmodule Convo.AuthController.CallbackTest do
  use Convo.ConnCase, async: true

  @moduletag controllers: :auth

  test "GET /auth/mixcloud/callback", %{conn: conn} do
    conn = get conn, auth_path(conn, :callback, "mixcloud"), %{
      "code" => "2D2vkFS25B"
    }

    assert get_session(conn, :access_token)
    assert redirected_to(conn) =~ "/"
  end
end