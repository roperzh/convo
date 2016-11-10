defmodule Convo.ConversionController.NewTest do
  use Convo.ConnCase, async: true

  @moduletag controllers: :conversion

  test "/ renders a form", %{conn: conn} do
    body =
      conn
      |> get(conversion_path(conn, :new))
      |> html_response(200)

    assert body =~ "New Conversion"
    assert body =~ "<form"
    assert body =~ ~s(action="#{conversion_path(conn, :create)}")
  end
end