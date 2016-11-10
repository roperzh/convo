defmodule Convo.Services.YoutubeTest do
  use ExUnit.Case, async: true

  alias Convo.Services.Youtube

  @moduletag services: :youtube

  test "#get_mp3_link! returns a link able to download the video in mp3" do
    link = Youtube.get_mp3_link!("jhFDyDgMVUI")

    assert link =~ "http://"
    assert link =~ ".mp3"
  end

  test "#download_mp3! downloads an mp3 from a video id" do
    mp3_blob = Youtube.download_mp3!("jhFDyDgMVUI")

    assert mp3_blob |> is_binary
  end
end