defmodule Convo.Services.YoutubeTest do
  use ExUnit.Case, async: true

  alias Convo.Services.Youtube

  @moduletag services: :youtube

  test "#get_mp3_link! returns a link able to download the video in mp3" do
    info = Youtube.get_mp3_info!("jhFDyDgMVUI")

    assert info.link =~ "http://"
    assert info.link =~ ".mp3"
    assert info.name == "song name"
  end

  test "#download_mp3! downloads an mp3 from a video id" do
    info = Youtube.get_mp3_info!("jhFDyDgMVUI")
    mp3_blob = Youtube.download_mp3!(info.link)

    assert mp3_blob |> is_binary
  end
end