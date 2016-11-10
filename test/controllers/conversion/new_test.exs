defmodule Convo.ConversionController.NewTest do
  use Convo.ConnCase, async: true

  @moduletag controllers: :conversion

  test "/conversions/new renders a form", %{conn: conn} do
    conn = get conn, conversion_path(conn, :new)

    body =
      conn
      |> html_response(200)

    assert body =~ "New Conversion"
    assert body =~ "<form"
    assert body =~ ~s(action="/conversions")
  end
end