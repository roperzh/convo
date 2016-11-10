defmodule Convo.Services.MixcloudApiTest do
  use ExUnit.Case, async: true

  alias Convo.Services.{MixcloudApi, Youtube}

  @moduletag services: :mixcloud

  test "#upload! uploads a mp3 file to mixcloud" do
    mp3 = Youtube.download_mp3!("jhFDyDgMVUI")
    name = "my song name"
    token = "EXSzVGJxSwE6MpkfQZWTc5zdJrL7xWXL"

    body =
      MixcloudApi.upload_mp3!(mp3, name, token)
      |> Map.get(:body)
      |> Poison.decode!

    assert body["result"]["message"] == "Uploaded #{name}"
  end
end