defmodule Convo.ConversionController.SuccessTest do
  use Convo.ConnCase, async: true

  @moduletag controllers: :conversion

  test "/success shows a message letting the user know that the upload is being processed", %{conn: conn} do
    body =
      conn
      |> get(conversion_path(conn, :success))
      |> html_response(200)

    assert body =~ "Your audio is getting uploaded!, Please check your provider profile"
  end

  test "/success shows the form to submit a new conversion", %{conn: conn} do
    body =
      conn
      |> get(conversion_path(conn, :success))
      |> html_response(200)

    assert body =~ "<form"
    assert body =~ ~s(action="#{conversion_path(conn, :create)}")
  end
end