defmodule Convo.Mocks.HTTP do
  def get!("http://www.yt-mp3.com/fetch?v=jhFDyDgMVUI") do
    body = %{
      "status" => "ok",
      "id" => "IKFr6m950cQ",
      "title" => "",
      "thumbnail" => "https://i.ytimg.com/vi/IKFr6m950cQ/hqdefault.jpg",
      "length" => 264,
      "artist" => "The XX ",
      "categories" => "People & Blogs",
      "bitrate" => 160,
      "average_rating" => 4.957,
      "view_count" => 259432,
      "progress" => 100,
      "ready" => true,
      "expires_in" => 7200,
      "url" => "//dlo2.yt-mp3.com/download/song.mp3",
      "video_url" => "//some-url.com"
    }

    %{
      body: Poison.encode!(body)
    }
  end

  def get!("http://dlo2.yt-mp3.com/download/song.mp3", _headers, _opts) do
    headers = %{
      status_code: 200
    }

    %{
      body: <<0, 1, 2, 3>>,
      headers: Poison.encode!(headers)
    }
  end

  def post!(_url, _body, _headers, _options) do
    body = %{
      "result" => %{
        "message": "Uploaded my song name",
        "key": "/roberto-jesus-dip/my-song-name/",
        "success": true
      }
    }

    %{
      body: Poison.encode!(body)
    }
  end
end