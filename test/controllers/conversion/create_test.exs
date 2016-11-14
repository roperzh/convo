defmodule Convo.ConversionController.CreateTest do
  use Convo.ConnCase, async: true

  @moduletag controllers: :conversion

  test "given a valid YT url it uploads a new mp3", %{conn: conn} do
    conn = post conn, conversion_path(conn, :create), %{
      conversion: %{
        video_url: "http://youtube.com/watch?v=jhFDyDgMVUI"
      }
    }

    assert redirected_to(conn) =~ conversion_path(conn, :success)
  end
end