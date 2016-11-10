defmodule Convo.ConversionController.CreateTest do
  use Convo.ConnCase, async: true

  @moduletag controllers: :conversion

  test "given a valid YT url it uploads a new mp3", %{conn: conn} do
    conn = post conn, conversion_path(conn, :create), %{
      conversion: %{
        video_id: "jhFDyDgMVUI",
        name: "my song name"
      }
    }

    resp = html_response(conn, 201)

    assert resp =~ "New song is on the way!"
    assert resp =~ "Uploaded my song name"
  end
end