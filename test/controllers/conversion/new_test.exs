defmodule Convo.ConversionController.NewTest do
  use Convo.ConnCase

  @moduletag controllers: :conversion

  test "/ renders a form if the user is authenticated", %{conn: conn} do
    body =
      conn
      |> login_user!
      |> get(conversion_path(conn, :new))
      |> html_response(200)

    assert body =~ "<form"
    assert body =~ ~s(action="#{conversion_path(conn, :create)}")
    assert body =~ "conversion[video_url]"
  end

  test "/ renders logout button the user is authenticated", %{conn: conn} do
    body =
      conn
      |> login_user!
      |> get(conversion_path(conn, :new))
      |> html_response(200)

    assert body =~ "Log out"
    assert body =~ auth_path(conn, :delete)
  end

  test "/ shows login info if the user is not authenticated", %{conn: conn} do
    body =
      conn
      |> get(conversion_path(conn, :new))
      |> html_response(200)

    refute body =~ "<form"
    assert body =~ "Login with"
    assert body =~ auth_path(conn, :index, "mixcloud")
  end
end