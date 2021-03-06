defmodule Convo.Services.Youtube do
  @http Application.get_env(:convo, :http)

  def get_mp3_info!(video_id) do
    resp =
      @http.get!("http://www.yt-mp3.com/fetch?v=#{video_id}")
      |> Map.get(:body)
      |> Poison.decode!

    %{
      link: "http:" <> resp["url"],
      name: resp["title"]
    }
  end

  def download_mp3!(url) do
    url
    |> @http.get!([], timeout: 999_999_999)
    |> Map.get(:body)
  end
end