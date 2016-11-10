defmodule Convo.ConversionController.SuccessTest do
  use Convo.ConnCase, async: true

  @moduletag controllers: :conversion

  test "/success", %{conn: conn} do
    body =
      conn
      |> get(conversion_path(conn, :success))
      |> html_response(200)

    assert body =~ "Your audio is getting uploaded!"
    assert body =~ "Please check your provider profile"
  end
end