defmodule Convo.Services.Youtube do
  @http Application.get_env(:convo, :http)

  def get_mp3_info!(video_id) do
    resp = @http.get!("http://www.yt-mp3.com/fetch?v=#{video_id}")
    link = Poison.decode!(resp.body)["url"]
    title = Poison.decode!(resp.body)["title"]

    %{link: "http:#{link}", name: title}
  end

  def download_mp3!(url) do
    url
    |> @http.get!([], timeout: 999_999_999)
    |> Map.get(:body)
  end
end