defmodule Convo.Services.Youtube do
  @http Application.get_env(:convo, :http)

  def get_mp3_link!(video_id) do
    resp = @http.get!("http://www.yt-mp3.com/fetch?v=#{video_id}")
    link = Poison.decode!(resp.body)["url"]
    "http:#{link}"
  end

  def download_mp3!(video_id) do
    video_id
    |> get_mp3_link!
    |> @http.get!([], timeout: 999_999_999)
    |> Map.get(:body)
  end
end